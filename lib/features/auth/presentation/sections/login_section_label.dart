import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class LoginSectionLabel extends StatelessWidget {
  final bool isDark;
  final String label;

  const LoginSectionLabel({
    super.key,
    required this.isDark,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 14,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.6,
            color: isDark
                ? AppColors.darkOnSurfaceVariant
                : AppColors.lightOnSurfaceVariant,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Divider(
            color: isDark ? AppColors.grey700 : AppColors.grey200,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
