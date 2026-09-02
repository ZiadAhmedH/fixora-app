import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/get_current_user_use_case.dart';
import '../../features/auth/domain/usecases/login_with_email_use_case.dart';
import '../../features/auth/domain/usecases/login_with_google_use_case.dart';
import '../../features/auth/domain/usecases/logout_use_case.dart';
import '../../features/auth/domain/usecases/register_use_case.dart';
import '../../features/auth/domain/usecases/watch_auth_state_use_case.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../shared/blocs/locale/locale_bloc.dart';
import '../../shared/blocs/theme/theme_bloc.dart';

/// Global service locator instance.
final GetIt sl = GetIt.instance;

/// Initialize all dependencies.
/// Call this in [main] before [runApp].
Future<void> initDependencies() async {
  // ── External ───────────────────────────────────────────────
  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // Firebase services
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  // Google Sign-In
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());

  // Secure storage
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    ),
  );

  // ── Auth: Data Sources ────────────────────────────────────
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: sl(),
      firestore: sl(),
      googleSignIn: sl(),
    ),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(storage: sl()),
  );

  // ── Auth: Repository ──────────────────────────────────────
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remote: sl(),
      local: sl(),
      firebaseAuth: sl(),
    ),
  );

  // ── Auth: Use Cases ───────────────────────────────────────
  sl.registerLazySingleton(() => LoginWithEmailUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => LoginWithGoogleUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
  sl.registerLazySingleton(() => WatchAuthStateUseCase(sl()));

  // ── Auth: BLoC ────────────────────────────────────────────
  sl.registerFactory(
    () => AuthBloc(
      loginWithEmail: sl(),
      register: sl(),
      loginWithGoogle: sl(),
      logout: sl(),
      getCurrentUser: sl(),
      watchAuthState: sl(),
    ),
  );

  // ── Shared Blocs ──────────────────────────────────────────
  _registerSharedBlocs();
}

void _registerSharedBlocs() {
  // ThemeBloc and LocaleBloc are provided at the app root via MultiBlocProvider.
  sl.registerFactory(() => ThemeBloc(sl()));
  sl.registerFactory(() => LocaleBloc(sl()));
}
