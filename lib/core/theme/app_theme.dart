import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// Provides [lightTheme] and [darkTheme] for the app.
abstract final class AppTheme {
  // ─────────────────────────── Light ────────────────────────────────────────
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: 'Cairo',

        // Color Scheme
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          onPrimary: AppColors.white,
          primaryContainer: AppColors.primaryLight,
          onPrimaryContainer: AppColors.primaryDark,
          secondary: AppColors.secondary,
          onSecondary: AppColors.white,
          secondaryContainer: AppColors.secondaryLight,
          onSecondaryContainer: AppColors.secondaryDark,
          error: AppColors.error,
          onError: AppColors.white,
          errorContainer: AppColors.errorLight,
          surface: AppColors.lightSurface,
          onSurface: AppColors.lightOnSurface,
          surfaceContainerHighest: AppColors.lightSurfaceVariant,
          onSurfaceVariant: AppColors.lightOnSurfaceVariant,
          outline: AppColors.grey300,
        ),

        scaffoldBackgroundColor: AppColors.lightBackground,

        // AppBar
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 1,
          backgroundColor: AppColors.lightSurface,
          foregroundColor: AppColors.lightOnSurface,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          titleTextStyle: AppTextStyles.titleLarge,
        ),

        // Card
        cardTheme: CardThemeData(
          elevation: 0,
          color: AppColors.lightSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.grey200),
          ),
        ),

        // Elevated Button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: AppTextStyles.labelLarge,
          ),
        ),

        // Outlined Button
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: AppTextStyles.labelLarge,
          ),
        ),

        // Text Button
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            textStyle: AppTextStyles.labelLarge,
          ),
        ),

        // Input Decoration
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.lightSurfaceVariant,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.grey300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.error),
          ),
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.grey500,
          ),
          labelStyle: AppTextStyles.bodyMedium,
        ),

        // Divider
        dividerTheme: const DividerThemeData(
          color: AppColors.divider,
          thickness: 1,
          space: 1,
        ),

        // Bottom Navigation Bar
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.lightSurface,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.grey500,
          elevation: 8,
          type: BottomNavigationBarType.fixed,
        ),

        // Chip
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.lightSurfaceVariant,
          selectedColor: AppColors.primaryLight,
          labelStyle: AppTextStyles.labelMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        // Text Theme
        textTheme: const TextTheme(
          displayLarge: AppTextStyles.displayLarge,
          displayMedium: AppTextStyles.displayMedium,
          displaySmall: AppTextStyles.displaySmall,
          headlineLarge: AppTextStyles.headlineLarge,
          headlineMedium: AppTextStyles.headlineMedium,
          headlineSmall: AppTextStyles.headlineSmall,
          titleLarge: AppTextStyles.titleLarge,
          titleMedium: AppTextStyles.titleMedium,
          titleSmall: AppTextStyles.titleSmall,
          bodyLarge: AppTextStyles.bodyLarge,
          bodyMedium: AppTextStyles.bodyMedium,
          bodySmall: AppTextStyles.bodySmall,
          labelLarge: AppTextStyles.labelLarge,
          labelMedium: AppTextStyles.labelMedium,
          labelSmall: AppTextStyles.labelSmall,
        ),
      );

  // ─────────────────────────── Dark ─────────────────────────────────────────
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: 'Cairo',

        // Color Scheme
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primaryLight,
          onPrimary: AppColors.primaryDark,
          primaryContainer: AppColors.primaryDark,
          onPrimaryContainer: AppColors.primaryLight,
          secondary: AppColors.secondaryLight,
          onSecondary: AppColors.secondaryDark,
          secondaryContainer: AppColors.secondaryDark,
          onSecondaryContainer: AppColors.secondaryLight,
          error: AppColors.errorLight,
          onError: AppColors.error,
          errorContainer: AppColors.error,
          surface: AppColors.darkSurface,
          onSurface: AppColors.darkOnSurface,
          surfaceContainerHighest: AppColors.darkSurfaceVariant,
          onSurfaceVariant: AppColors.darkOnSurfaceVariant,
          outline: AppColors.grey700,
        ),

        scaffoldBackgroundColor: AppColors.darkBackground,

        // AppBar
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 1,
          backgroundColor: AppColors.darkSurface,
          foregroundColor: AppColors.darkOnSurface,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          titleTextStyle: AppTextStyles.titleLarge,
        ),

        // Card
        cardTheme: CardThemeData(
          elevation: 0,
          color: AppColors.darkSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.grey800),
          ),
        ),

        // Elevated Button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryLight,
            foregroundColor: AppColors.primaryDark,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: AppTextStyles.labelLarge,
          ),
        ),

        // Outlined Button
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryLight,
            side: const BorderSide(color: AppColors.primaryLight),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: AppTextStyles.labelLarge,
          ),
        ),

        // Text Button
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryLight,
            textStyle: AppTextStyles.labelLarge,
          ),
        ),

        // Input Decoration
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.darkSurfaceVariant,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.grey700),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: AppColors.primaryLight, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.errorLight),
          ),
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.grey600,
          ),
          labelStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.darkOnSurfaceVariant,
          ),
        ),

        // Divider
        dividerTheme: const DividerThemeData(
          color: AppColors.dividerDark,
          thickness: 1,
          space: 1,
        ),

        // Bottom Navigation Bar
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkSurface,
          selectedItemColor: AppColors.primaryLight,
          unselectedItemColor: AppColors.grey600,
          elevation: 8,
          type: BottomNavigationBarType.fixed,
        ),

        // Chip
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.darkSurfaceVariant,
          selectedColor: AppColors.primaryDark,
          labelStyle: AppTextStyles.labelMedium.copyWith(
            color: AppColors.darkOnSurface,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        // Text Theme
        textTheme: TextTheme(
          displayLarge:
              AppTextStyles.displayLarge.copyWith(color: AppColors.darkOnSurface),
          displayMedium:
              AppTextStyles.displayMedium.copyWith(color: AppColors.darkOnSurface),
          displaySmall:
              AppTextStyles.displaySmall.copyWith(color: AppColors.darkOnSurface),
          headlineLarge:
              AppTextStyles.headlineLarge.copyWith(color: AppColors.darkOnSurface),
          headlineMedium:
              AppTextStyles.headlineMedium.copyWith(color: AppColors.darkOnSurface),
          headlineSmall:
              AppTextStyles.headlineSmall.copyWith(color: AppColors.darkOnSurface),
          titleLarge:
              AppTextStyles.titleLarge.copyWith(color: AppColors.darkOnSurface),
          titleMedium:
              AppTextStyles.titleMedium.copyWith(color: AppColors.darkOnSurface),
          titleSmall:
              AppTextStyles.titleSmall.copyWith(color: AppColors.darkOnSurface),
          bodyLarge:
              AppTextStyles.bodyLarge.copyWith(color: AppColors.darkOnSurface),
          bodyMedium:
              AppTextStyles.bodyMedium.copyWith(color: AppColors.darkOnSurfaceVariant),
          bodySmall:
              AppTextStyles.bodySmall.copyWith(color: AppColors.darkOnSurfaceVariant),
          labelLarge:
              AppTextStyles.labelLarge.copyWith(color: AppColors.darkOnSurface),
          labelMedium:
              AppTextStyles.labelMedium.copyWith(color: AppColors.darkOnSurfaceVariant),
          labelSmall:
              AppTextStyles.labelSmall.copyWith(color: AppColors.darkOnSurfaceVariant),
        ),
      );
}
