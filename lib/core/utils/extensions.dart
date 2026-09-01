import 'package:flutter/material.dart';

/// Handy extensions for use throughout the app.
extension ContextExtensions on BuildContext {
  // ── Theme shortcuts ──────────────────────────────────────
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  // ── Screen dimensions ────────────────────────────────────
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  bool get isTablet => screenWidth >= 600;

  // ── Padding shortcuts ────────────────────────────────────
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
}

extension StringExtensions on String {
  /// Capitalizes first letter of a string.
  String get capitalize =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  /// Returns true if the string is a valid email.
  bool get isValidEmail => RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      ).hasMatch(this);

  /// Returns true if the string is a valid password (min 8 chars).
  bool get isValidPassword => length >= 8;
}

extension IterableExtensions<T> on Iterable<T> {
  /// Returns the first element or null.
  T? get firstOrNull => isEmpty ? null : first;
}
