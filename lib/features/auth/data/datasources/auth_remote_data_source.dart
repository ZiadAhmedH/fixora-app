import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/app_user.dart';
import '../models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> loginWithEmail({
    required String email,
    required String password,
  });

  Future<UserModel> register({
    required String email,
    required String password,
    required String displayName,
    required UserRole role,
  });

  Future<UserModel> loginWithGoogle({UserRole? role});

  Future<void> logout();

  Future<UserModel?> getCurrentUser();

  Stream<UserModel?> watchAuthState();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  AuthRemoteDataSourceImpl({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
    required GoogleSignIn googleSignIn,
  }) : _firebaseAuth = firebaseAuth,
       _firestore = firestore,
       _googleSignIn = googleSignIn;

  // ── Helpers ──────────────────────────────────────────────────────────────

  CollectionReference<Map<String, dynamic>> get _usersCol =>
      _firestore.collection('users');

  Future<UserModel> _fetchOrThrow(String uid) async {
    final doc = await _usersCol.doc(uid).get();
    if (!doc.exists) {
      throw const AuthException(message: 'User profile not found.');
    }
    return UserModel.fromFirestore(doc);
  }

  void _mapFirebaseAuthException(FirebaseAuthException e) {
    throw AuthException.fromFirebaseCode(e.code);
  }

  // ── Login with email ──────────────────────────────────────────────────────

  @override
  Future<UserModel> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _fetchOrThrow(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      _mapFirebaseAuthException(e);
      rethrow;
    }
  }

  // ── Register ──────────────────────────────────────────────────────────────

  @override
  Future<UserModel> register({
    required String email,
    required String password,
    required String displayName,
    required UserRole role,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user!;
      await user.updateDisplayName(displayName);

      final roleStr = role.name; // 'technician' | 'client' | 'admin'

      final model = UserModel(
        uid: user.uid,
        email: email,
        displayName: displayName,
        photoUrl: null,
        role: roleStr,
        createdAt: DateTime.now(),
      );

      await _usersCol.doc(user.uid).set(model.toFirestore());
      return model;
    } on FirebaseAuthException catch (e) {
      _mapFirebaseAuthException(e);
      rethrow;
    }
  }

  // ── Google Sign-In ────────────────────────────────────────────────────────

  @override
  Future<UserModel> loginWithGoogle({UserRole? role}) async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw const AuthException(message: 'Google sign-in was cancelled.');
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      final firebaseUser = userCredential.user!;

      // Check if user profile already exists in Firestore
      final doc = await _usersCol.doc(firebaseUser.uid).get();

      if (doc.exists) {
        // Returning user — just fetch profile
        return UserModel.fromFirestore(doc);
      } else {
        // First-time Google user — create profile with provided role
        final roleStr = (role ?? UserRole.client).name;
        final model = UserModel(
          uid: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName ?? googleUser.displayName ?? '',
          photoUrl: firebaseUser.photoURL ?? googleUser.photoUrl,
          role: roleStr,
          createdAt: DateTime.now(),
        );
        // save user to firestore:
        await _usersCol.doc(firebaseUser.uid).set(model.toFirestore());
        return model;
      }
    } on FirebaseAuthException catch (e) {
      _mapFirebaseAuthException(e);
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;
    try {
      return await _fetchOrThrow(user.uid);
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<UserModel?> watchAuthState() {
    return _firebaseAuth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;
      try {
        return await _fetchOrThrow(user.uid);
      } catch (_) {
        return null;
      }
    });
  }
}
