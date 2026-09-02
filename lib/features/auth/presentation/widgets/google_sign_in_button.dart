import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;

  const GoogleSignInButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor:
              isDark ? AppColors.darkSurfaceVariant : AppColors.white,
          side: BorderSide(
            color: isDark ? AppColors.grey700 : AppColors.grey300,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2.5),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _GoogleLogo(),
                  const SizedBox(width: 10),
                  Text(
                    'Continue with Google',
                    style: TextStyle(
                      color: isDark
                          ? AppColors.darkOnSurface
                          : AppColors.lightOnSurface,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

/// Hand-drawn Google "G" logo using CustomPaint.
class _GoogleLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(20, 20),
      painter: _GoogleLogoPainter(),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Quadrant colors
    const colors = [
      Color(0xFF4285F4), // Blue   — top right
      Color(0xFF34A853), // Green  — bottom right
      Color(0xFFFBBC05), // Yellow — bottom left
      Color(0xFFEA4335), // Red    — top left
    ];

    final paint = Paint()..style = PaintingStyle.fill;
    for (int i = 0; i < 4; i++) {
      paint.color = colors[i];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        (i * 90 - 45) * 3.14159 / 180,
        90 * 3.14159 / 180,
        true,
        paint,
      );
    }

    // White inner circle (donut effect)
    paint.color = Colors.white;
    canvas.drawCircle(center, radius * 0.55, paint);

    // Blue horizontal bar for the "G"
    paint.color = const Color(0xFF4285F4);
    canvas.drawRect(
      Rect.fromLTWH(
        center.dx - 0.5,
        center.dy - radius * 0.22,
        radius * 0.95,
        radius * 0.44,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
