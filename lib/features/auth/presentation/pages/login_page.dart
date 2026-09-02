import 'package:feild_service_app/features/auth/presentation/sections/login_form_section.dart';
import 'package:feild_service_app/features/auth/presentation/sections/login_hero_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

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
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkBackground
          : AppColors.lightBackground,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeMap(
            failure: (f) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(f.message),
                backgroundColor: AppColors.error,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            orElse: () {},
          );
        },
        child: Column(
          children: [
            LoginHeroSection(size: size),

            Expanded(
              child: FadeTransition(
                opacity: _fadeAnim,
                child: SlideTransition(
                  position: _slideAnim,
                  child: LoginFormSection(
                    isDark: isDark,
                    formKey: _formKey,
                    emailCtrl: _emailCtrl,
                    passCtrl: _passCtrl,
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
