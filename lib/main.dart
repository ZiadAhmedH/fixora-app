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

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initDependencies();

  runApp(const FieldServiceApp());
}

class FieldServiceApp extends StatelessWidget {
  const FieldServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (_) => sl<ThemeBloc>()..add(const ThemeEvent.load()),
      child: BlocProvider<LocaleBloc>(
        create: (_) => sl<LocaleBloc>()..add(const LocaleEvent.load()),
        child: const _AppView(),
      ),
    );
  }
}

class _AppView extends StatefulWidget {
  const _AppView();

  @override
  State<_AppView> createState() => _AppViewState();
}

class _AppViewState extends State<_AppView> {
  final _router = AppRouter.createRouter();

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select((ThemeBloc bloc) => bloc.state.themeMode);
    final locale = context.select((LocaleBloc bloc) => bloc.state.locale);

    return MaterialApp.router(
      title: 'Field Service App',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      locale: locale,
      supportedLocales: appSupportedLocales,
      localizationsDelegates: appLocalizationDelegates,
    );
  }
}
