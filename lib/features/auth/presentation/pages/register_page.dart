import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/app_user.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/google_sign_in_button.dart';
import '../widgets/primary_auth_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();

  UserRole _selectedRole = UserRole.client;

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
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmPassCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(
          AuthEvent.register(
            email: _emailCtrl.text.trim(),
            password: _passCtrl.text,
            displayName: _nameCtrl.text.trim(),
            role: _selectedRole,
          ),
        );
  }

  void _googleSignIn() {
    context.read<AuthBloc>().add(
          AuthEvent.loginWithGoogle(role: _selectedRole),
        );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.darkBackground : AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface,
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
      ),
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
            orElse: () {},
          );
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
            child: FadeTransition(
              opacity: _fadeAnim,
              child: SlideTransition(
                position: _slideAnim,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Header(),
                      const SizedBox(height: 28),

                      // ── Role Selector ───────────────────────────────────
                      Text(
                        'I am registering as',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? AppColors.darkOnSurfaceVariant
                              : AppColors.lightOnSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _RoleSelector(
                        selected: _selectedRole,
                        onChanged: (role) =>
                            setState(() => _selectedRole = role),
                      ),
                      const SizedBox(height: 24),

                      // ── Form Fields ─────────────────────────────────────
                      AuthTextField(
                        label: 'Full Name',
                        hint: 'John Doe',
                        controller: _nameCtrl,
                        prefixIcon: Icons.person_outline,
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Enter your name';
                          if (v.length < 2) return 'Name too short';
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
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
                      const SizedBox(height: 14),
                      AuthTextField(
                        label: 'Password',
                        hint: '••••••••',
                        controller: _passCtrl,
                        isPassword: true,
                        prefixIcon: Icons.lock_outline,
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Enter a password';
                          if (v.length < 6) return 'Min 6 characters';
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                      AuthTextField(
                        label: 'Confirm Password',
                        hint: '••••••••',
                        controller: _confirmPassCtrl,
                        isPassword: true,
                        prefixIcon: Icons.lock_outline,
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Confirm your password';
                          if (v != _passCtrl.text) return 'Passwords do not match';
                          return null;
                        },
                      ),
                      const SizedBox(height: 28),

                      // ── Submit button ────────────────────────────────────
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
                            label: 'Create Account',
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
                      _LoginLink(),
                      const SizedBox(height: 24),
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

// ── Sub-widgets ─────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create account',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Join the Field Service platform',
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

class _RoleSelector extends StatelessWidget {
  final UserRole selected;
  final ValueChanged<UserRole> onChanged;

  const _RoleSelector({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _RoleCard(
            role: UserRole.client,
            label: 'Client',
            subtitle: 'Request services',
            icon: Icons.business_center_outlined,
            isSelected: selected == UserRole.client,
            onTap: () => onChanged(UserRole.client),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _RoleCard(
            role: UserRole.technician,
            label: 'Technician',
            subtitle: 'Provide services',
            icon: Icons.construction_outlined,
            isSelected: selected == UserRole.technician,
            onTap: () => onChanged(UserRole.technician),
          ),
        ),
      ],
    );
  }
}

class _RoleCard extends StatelessWidget {
  final UserRole role;
  final String label;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.role,
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primary.withValues(alpha: isDark ? 0.18 : 0.08)
            : (isDark ? AppColors.darkSurfaceVariant : AppColors.lightSurface),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? AppColors.primary : (isDark ? AppColors.grey700 : AppColors.grey200),
          width: isSelected ? 2 : 1,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : (isDark ? AppColors.darkBackground : AppColors.grey100),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 22,
                  color: isSelected
                      ? Colors.white
                      : (isDark ? AppColors.grey400 : AppColors.grey600),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: isSelected
                      ? AppColors.primary
                      : (isDark
                          ? AppColors.darkOnSurface
                          : AppColors.lightOnSurface),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11,
                  color: isDark
                      ? AppColors.darkOnSurfaceVariant
                      : AppColors.lightOnSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
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
                color: isDark ? AppColors.grey700 : AppColors.grey300)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('or',
              style: TextStyle(color: AppColors.grey500, fontSize: 13)),
        ),
        Expanded(
            child: Divider(
                color: isDark ? AppColors.grey700 : AppColors.grey300)),
      ],
    );
  }
}

class _LoginLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account? ",
            style: TextStyle(color: AppColors.grey500, fontSize: 14)),
        TextButton(
          onPressed: () => context.pop(),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'Sign In',
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
