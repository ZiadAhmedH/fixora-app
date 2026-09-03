import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/app_user.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../sections/register_form_section.dart';
import '../sections/register_hero_section.dart';

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
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.06),
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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeMap(
            registerSuccess: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Account created! Please sign in.'),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
              context.pop();
            },
            failure: (f) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(f.message),
                backgroundColor: AppColors.error,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            orElse: () {},
          );
        },
        child: Column(
          children: [
            // ── Section 1: Hero / Branding ──────────────────────────────
            RegisterHeroSection(),

            // ── Section 2: Form Card ────────────────────────────────────
            Expanded(
              child: FadeTransition(
                opacity: _fadeAnim,
                child: SlideTransition(
                  position: _slideAnim,
                  child: RegisterFormSection(
                    isDark: isDark,
                    formKey: _formKey,
                    nameCtrl: _nameCtrl,
                    emailCtrl: _emailCtrl,
                    passCtrl: _passCtrl,
                    confirmPassCtrl: _confirmPassCtrl,
                    selectedRole: _selectedRole,
                    onRoleChanged: (role) =>
                        setState(() => _selectedRole = role),
                    onSubmit: _submit,
                    onGoogleSignIn: _googleSignIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
