import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes/route_names.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DeepLinkService — Handles incoming App Links & Universal Links
// ─────────────────────────────────────────────────────────────────────────────

class DeepLinkService {
  DeepLinkService({AppLinks? appLinks}) : _appLinks = appLinks ?? AppLinks();

  final AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;
  bool _isInitialized = false;

  /// Holds the target route if a deep link arrived while the app was starting up
  /// or displaying the Splash screen.
  static String? pendingDeepLink;

  /// Recursively extracts the Firebase one-time reset code ([oobCode])
  /// from direct parameters, nested Firebase link parameters, or raw URL strings.
  static String? extractOobCode(Uri uri) {
    // 1. Direct query parameter
    if (uri.queryParameters.containsKey('oobCode')) {
      final code = uri.queryParameters['oobCode'];
      if (code != null && code.isNotEmpty) return code;
    }

    // 2. Nested "link" parameter:
    //    e.g. /__/auth/links?link=https://.../__/auth/action?...oobCode=XYZ...
    if (uri.queryParameters.containsKey('link')) {
      final nested = uri.queryParameters['link'];
      if (nested != null && nested.isNotEmpty) {
        final nestedUri = Uri.tryParse(nested);
        if (nestedUri != null) {
          final code = extractOobCode(nestedUri);
          if (code != null && code.isNotEmpty) return code;
        }
      }
    }

    // 3. Nested "continueUrl" parameter
    if (uri.queryParameters.containsKey('continueUrl')) {
      final nested = uri.queryParameters['continueUrl'];
      if (nested != null && nested.isNotEmpty) {
        final nestedUri = Uri.tryParse(nested);
        if (nestedUri != null) {
          final code = extractOobCode(nestedUri);
          if (code != null && code.isNotEmpty) return code;
        }
      }
    }

    // 4. Regex fallback across the full decoded URL
    final rawString = uri.toString();
    final decodedString = Uri.decodeFull(rawString);
    final match = RegExp(r'[?&]oobCode=([^&]+)').firstMatch(decodedString);
    if (match != null && match.groupCount >= 1) {
      final code = match.group(1);
      if (code != null && code.isNotEmpty) return code;
    }

    return null;
  }

  /// Initializes deep-link listening with the app's [GoRouter].
  Future<void> init(GoRouter router) async {
    if (_isInitialized) return;
    _isInitialized = true;

    // 1. Listen for links while the app is active / in background
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uri) => _handleUri(router, uri),
      onError: (Object error) {
        debugPrint('[DeepLinkService] Link stream error: $error');
      },
    );

    // 2. Check for cold-start launch link
    try {
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        debugPrint('[DeepLinkService] App launched via deep link: $initialUri');
        _handleUri(router, initialUri);
      }
    } catch (e) {
      debugPrint('[DeepLinkService] Failed to get initial link: $e');
    }
  }

  /// Extracts the reset code and navigates to the set new password screen.
  void _handleUri(GoRouter router, Uri uri) {
    debugPrint('[DeepLinkService] Received URI: $uri');

    final oobCode = extractOobCode(uri);
    debugPrint('[DeepLinkService] Extracted oobCode: $oobCode');

    if (oobCode != null && oobCode.isNotEmpty) {
      final target = '${RouteNames.setNewPassword}?oobCode=$oobCode';
      debugPrint('[DeepLinkService] Set pendingDeepLink and routing to: $target');
      pendingDeepLink = target;
      router.go(target);
    }
  }

  /// Cancels active stream subscriptions.
  void dispose() {
    _linkSubscription?.cancel();
    _linkSubscription = null;
    _isInitialized = false;
  }
}
