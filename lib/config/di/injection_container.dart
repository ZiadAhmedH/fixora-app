import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // ── Blocs ─────────────────────────────────────────────────
  _registerBlocs();

  // ── Data Sources ──────────────────────────────────────────
  _registerDataSources();

  // ── Repositories ──────────────────────────────────────────
  _registerRepositories();

  // ── Use Cases ─────────────────────────────────────────────
  _registerUseCases();
}

void _registerBlocs() {
  // ThemeBloc and LocaleBloc are registered in their respective files
  // and provided at the app root via MultiBlocProvider.
  //
  // Feature blocs go here, e.g.:
  // sl.registerFactory(() => AuthBloc(loginUseCase: sl()));
}

void _registerDataSources() {
  // e.g. sl.registerLazySingleton<AuthRemoteDataSource>(
  //   () => AuthRemoteDataSourceImpl(client: sl()),
  // );
}

void _registerRepositories() {
  // e.g. sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(remoteDataSource: sl()),
  // );
}

void _registerUseCases() {
  // e.g. sl.registerLazySingleton(() => LoginUseCase(sl()));
}
