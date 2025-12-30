import 'package:flutter/material.dart';

class OverlayLoader {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context, {String? message}) {
    if (_overlayEntry != null) return;

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    _overlayEntry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          // Semi-transparent background that adapts to theme
          ModalBarrier(
            color: isDark
                ? Colors.black.withValues(alpha: 0.7)
                : Colors.black.withValues(alpha: 0.5),
            dismissible: false,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDark ? theme.colorScheme.surface : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              constraints: const BoxConstraints(minWidth: 200, maxWidth: 300),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Circular progress indicator with theme-aware color
                  CircularProgressIndicator(color: theme.colorScheme.primary),
                  if (message != null) ...[
                    const SizedBox(height: 16),
                    Flexible(
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: isDark
                              ? theme.colorScheme.onSurface
                              : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  static void updateMessage(BuildContext context, String message) {
    if (_overlayEntry == null) return;

    // To update the message, we need to rebuild the overlay
    // We'll remove the current one and show a new one with updated message
    hide();
    show(context, message: message);
  }

  // Optional: Show loader with custom theme properties
  static void showWithCustomTheme(
    BuildContext context, {
    String? message,
    Color? backgroundColor,
    Color? progressColor,
    Color? textColor,
  }) {
    if (_overlayEntry != null) return;

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    _overlayEntry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          ModalBarrier(
            color: isDark
                ? Colors.black.withValues(alpha: 0.7)
                : Colors.black.withValues(alpha: 0.5),
            dismissible: false,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color:
                    backgroundColor ??
                    (isDark ? theme.colorScheme.surface : Colors.white),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              constraints: const BoxConstraints(minWidth: 200, maxWidth: 300),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: progressColor ?? theme.colorScheme.primary,
                  ),
                  if (message != null) ...[
                    const SizedBox(height: 16),
                    Flexible(
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color:
                              textColor ??
                              (isDark
                                  ? theme.colorScheme.onSurface
                                  : Colors.black),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }
}
