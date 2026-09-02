import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/app_user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Firestore document path: /users/{uid}
@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String uid,
    required String email,
    required String displayName,
    String? photoUrl,
    @Default('client') String role,
    required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Convert from Firestore document snapshot.
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel.fromJson({
      ...data,
      'uid': doc.id,
      // Firestore Timestamp → ISO string for json_serializable
      if (data['createdAt'] is Timestamp)
        'createdAt': (data['createdAt'] as Timestamp).toDate().toIso8601String(),
    });
  }

  /// Convert to Firestore-compatible map (uid excluded — it's the doc ID).
  Map<String, dynamic> toFirestore() => {
        'email': email,
        'displayName': displayName,
        if (photoUrl != null) 'photoUrl': photoUrl,
        'role': role,
        'createdAt': FieldValue.serverTimestamp(),
      };

  /// Map to domain entity.
  AppUser toEntity() => AppUser(
        uid: uid,
        email: email,
        displayName: displayName,
        photoUrl: photoUrl,
        role: _roleFromString(role),
        createdAt: createdAt,
      );

  static UserRole _roleFromString(String role) => switch (role) {
        'technician' => UserRole.technician,
        'admin' => UserRole.admin,
        _ => UserRole.client,
      };
}
