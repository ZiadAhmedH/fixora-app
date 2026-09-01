import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/di/injection_container.dart';
import 'config/routes/app_router.dart';
import 'core/localization/app_localizations_setup.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';
import 'shared/blocs/locale/locale_bloc.dart';
import 'shared/blocs/theme/theme_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ── Firebase ──────────────────────────────────────────────
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initDependencies();

  runApp(const FieldServiceApp());
}

class FieldServiceApp extends StatelessWidget {
  const FieldServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(sl())..add(const ThemeEvent.load()),
        ),
        BlocProvider<LocaleBloc>(
          create: (_) => LocaleBloc(sl())..add(const LocaleEvent.load()),
        ),
      ],
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select((ThemeBloc bloc) => bloc.state.themeMode);
    final locale = context.select((LocaleBloc bloc) => bloc.state.locale);

    return MaterialApp.router(
      // ── Identity ────────────────────────────────────────────
      title: 'Field Service App',
      debugShowCheckedModeBanner: false,

      // ── Routing ─────────────────────────────────────────────
      routerConfig: AppRouter.router,

      // ── Theming ─────────────────────────────────────────────
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,

      // ── Localization ────────────────────────────────────────
      locale: locale,
      supportedLocales: appSupportedLocales,
      localizationsDelegates: appLocalizationDelegates,
    );
  }
}
