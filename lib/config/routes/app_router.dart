import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../config/di/injection_container.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_event.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import 'route_names.dart';

/// Application router using [GoRouter].
///
/// [AuthBloc] is created and owned here — not at the app root.
/// It is provided to all child routes via a top-level [ShellRoute]
/// using [BlocProvider.value], so every page can access it with
/// `context.read<AuthBloc>()`.
abstract final class AppRouter {
  static GoRouter createRouter() {
    // AuthBloc is created here and kicked off immediately.
    final authBloc = sl<AuthBloc>()..add(const AuthEvent.checkAuthStatus());
    final notifier = _AuthChangeNotifier(authBloc);

    return GoRouter(
      initialLocation: RouteNames.home,
      debugLogDiagnostics: true,
      refreshListenable: notifier,

      // ── Auth Guard ──────────────────────────────────────────────────────
      redirect: (context, state) {
        final isOnAuthRoute = state.matchedLocation == RouteNames.login ||
            state.matchedLocation == RouteNames.register;

        return authBloc.state.map(
          initial: (_) => null, // Wait for checkAuthStatus to resolve
          loading: (_) => null,
          authenticated: (_) =>
              isOnAuthRoute ? RouteNames.home : null,
          unauthenticated: (_) =>
              isOnAuthRoute ? null : RouteNames.login,
          failure: (_) =>
              isOnAuthRoute ? null : RouteNames.login,
        );
      },

      routes: [
        // ── Shell: provides AuthBloc to every route below ─────────────────
        ShellRoute(
          builder: (context, state, child) => BlocProvider<AuthBloc>.value(
            value: authBloc,
            child: child,
          ),
          routes: [
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

      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text('Page not found: ${state.uri}'),
        ),
      ),
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
