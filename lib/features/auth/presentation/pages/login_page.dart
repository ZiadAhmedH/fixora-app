import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/google_sign_in_button.dart';
import '../widgets/primary_auth_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  late final AnimationController _animCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut));
    _animCtrl.forward();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(
          AuthEvent.loginWithEmail(
            email: _emailCtrl.text.trim(),
            password: _passCtrl.text,
          ),
        );
  }

  void _googleSignIn() {
    context.read<AuthBloc>().add(const AuthEvent.loginWithGoogle());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeMap(
            failure: (f) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(f.message),
                backgroundColor: AppColors.error,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            // Routing is handled by GoRouter redirect — no manual push needed
            orElse: () {},
          );
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
            child: FadeTransition(
              opacity: _fadeAnim,
              child: SlideTransition(
                position: _slideAnim,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      _Header(),
                      const SizedBox(height: 40),
                      AuthTextField(
                        label: 'Email',
                        hint: 'you@example.com',
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.email_outlined,
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Enter your email';
                          if (!v.contains('@')) return 'Invalid email';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      AuthTextField(
                        label: 'Password',
                        hint: '••••••••',
                        controller: _passCtrl,
                        isPassword: true,
                        prefixIcon: Icons.lock_outline,
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Enter your password';
                          if (v.length < 6) return 'Min 6 characters';
                          return null;
                        },
                      ),
                      const SizedBox(height: 28),
                      BlocBuilder<AuthBloc, AuthState>(
                        buildWhen: (p, c) => c.maybeMap(
                          loading: (_) => true,
                          failure: (_) => true,
                          unauthenticated: (_) => true,
                          orElse: () => false,
                        ),
                        builder: (context, state) {
                          final isLoading = state.maybeMap(
                            loading: (_) => true,
                            orElse: () => false,
                          );
                          return PrimaryAuthButton(
                            label: 'Sign In',
                            isLoading: isLoading,
                            onPressed: isLoading ? null : _submit,
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _Divider(),
                      const SizedBox(height: 20),
                      BlocBuilder<AuthBloc, AuthState>(
                        buildWhen: (p, c) => c.maybeMap(
                          loading: (_) => true,
                          failure: (_) => true,
                          unauthenticated: (_) => true,
                          orElse: () => false,
                        ),
                        builder: (context, state) {
                          final isLoading = state.maybeMap(
                            loading: (_) => true,
                            orElse: () => false,
                          );
                          return GoogleSignInButton(
                            isLoading: isLoading,
                            onPressed: isLoading ? null : _googleSignIn,
                          );
                        },
                      ),
                      const SizedBox(height: 32),
                      _RegisterLink(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.primaryDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.4),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.engineering_rounded,
              color: Colors.white, size: 28),
        ),
        const SizedBox(height: 24),
        Text(
          'Welcome back',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Sign in to your Field Service account',
          style: TextStyle(
            fontSize: 15,
            color: isDark
                ? AppColors.darkOnSurfaceVariant
                : AppColors.lightOnSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: isDark ? AppColors.grey700 : AppColors.grey300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'or',
            style: TextStyle(
              color: AppColors.grey500,
              fontSize: 13,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: isDark ? AppColors.grey700 : AppColors.grey300,
          ),
        ),
      ],
    );
  }
}

class _RegisterLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            color: AppColors.grey500,
            fontSize: 14,
          ),
        ),
        TextButton(
          onPressed: () => context.push(RouteNames.register),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'Register',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
