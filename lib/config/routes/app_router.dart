import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../config/di/injection_container.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_event.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/splash/presentation/bloc/splash_bloc.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'route_names.dart';

abstract final class AppRouter {
  static GoRouter createRouter() {
    final authBloc = sl<AuthBloc>()..add(const AuthEvent.checkAuthStatus());
    final notifier = _AuthChangeNotifier(authBloc);

    return GoRouter(
      initialLocation: RouteNames.splash,
      debugLogDiagnostics: true,
      refreshListenable: notifier,

      redirect: (context, state) {
        final isOnAuthRoute =
            state.matchedLocation == RouteNames.login ||
            state.matchedLocation == RouteNames.register;
        final isOnSplash = state.matchedLocation == RouteNames.splash;

        // Let splash handle its own routing; don't intercept it.
        if (isOnSplash) return null;

        return authBloc.state.map(
          initial: (_) => RouteNames.splash,
          loading: (_) => null,
          loadingEmail: (_) => null,
          loadingGoogle: (_) => null,
          registerSuccess: (_) => null,
          authenticated: (_) => isOnAuthRoute ? RouteNames.home : null,
          unauthenticated: (_) => isOnAuthRoute ? null : RouteNames.login,
          failure: (_) => isOnAuthRoute ? null : RouteNames.login,
        );
      },

      routes: [
        // ── Shell: provides AuthBloc to every route below ─────────────────
        ShellRoute(
          builder: (context, state, child) =>
              BlocProvider<AuthBloc>.value(value: authBloc, child: child),
          routes: [
            // ── Splash route ─────────────────────────────────────────
            GoRoute(
              path: RouteNames.splash,
              name: 'splash',
              builder: (context, state) => BlocProvider(
                create: (_) => sl<SplashBloc>(),
                child: const SplashPage(),
              ),
            ),

            // ── Auth routes ───────────────────────────────────────────────
            GoRoute(
              path: RouteNames.login,
              name: 'login',
              builder: (context, state) => const LoginPage(),
            ),
            GoRoute(
              path: RouteNames.register,
              name: 'register',
              builder: (context, state) => const RegisterPage(),
            ),

            // ── App routes ────────────────────────────────────────────────
            GoRoute(
              path: RouteNames.home,
              name: 'home',
              builder: (context, state) =>
                  const _PlaceholderPage(title: 'Home'),
            ),
            GoRoute(
              path: RouteNames.settings,
              name: 'settings',
              builder: (context, state) =>
                  const _PlaceholderPage(title: 'Settings'),
            ),
            GoRoute(
              path: RouteNames.profile,
              name: 'profile',
              builder: (context, state) =>
                  const _PlaceholderPage(title: 'Profile'),
            ),
          ],
        ),
      ],

      errorBuilder: (context, state) =>
          Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
    );
  }
}

/// Notifies [GoRouter] whenever [AuthBloc] emits a new state so the
/// redirect guard is re-evaluated automatically.
class _AuthChangeNotifier extends ChangeNotifier {
  _AuthChangeNotifier(AuthBloc bloc) {
    bloc.stream.listen((_) => notifyListeners());
  }
}

/// Temporary placeholder used until real pages are built.
class _PlaceholderPage extends StatelessWidget {
  final String title;
  const _PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$title Page — Coming Soon'),
            if (title == 'Home') ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () =>
                    context.read<AuthBloc>().add(const AuthEvent.logout()),
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
