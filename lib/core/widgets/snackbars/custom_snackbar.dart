import 'package:flutter/material.dart';

enum SnackbarType { normal, success, error }

class CustomSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    required SnackbarType type,
    String? actionText,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 4),
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Colors for different types
    final Color backgroundColor;
    final Color textColor;
    final IconData icon;
    final Color iconColor;

    switch (type) {
      case SnackbarType.success:
        backgroundColor = isDark
            ? const Color(0xFF052E16)
            : const Color(0xFFF0FDF4);
        textColor = isDark ? const Color(0xFFBBF7D0) : const Color(0xFF166534);
        icon = Icons.check_circle;
        iconColor = isDark ? const Color(0xFF4ADE80) : const Color(0xFF16A34A);
        break;
      case SnackbarType.error:
        backgroundColor = isDark
            ? const Color(0xFF450A0A)
            : const Color(0xFFFEF2F2);
        textColor = isDark ? const Color(0xFFFECACA) : const Color(0xFF991B1B);
        icon = Icons.error;
        iconColor = isDark ? const Color(0xFFF87171) : const Color(0xFFDC2626);
        break;
      case SnackbarType.normal:
        backgroundColor = isDark
            ? const Color(0xFF1E293B)
            : const Color(0xFFF8FAFC);
        textColor = isDark ? const Color(0xFFE2E8F0) : const Color(0xFF475569);
        icon = Icons.info;
        iconColor = isDark ? const Color(0xFF60A5FA) : const Color(0xFF3B82F6);
        break;
    }

    // Get the ScaffoldMessengerState before any async operations
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // Remove any existing snackbar
    scaffoldMessenger.hideCurrentSnackBar();

    // Show new snackbar
    scaffoldMessenger.showSnackBar(
      SnackBar(
        duration: duration,
        elevation: 6,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        padding: EdgeInsets.zero,
        content: _CustomSnackbarContent(
          message: message,
          type: type,
          backgroundColor: backgroundColor,
          textColor: textColor,
          icon: icon,
          iconColor: iconColor,
          actionText: actionText,
          onActionPressed: onActionPressed,
          scaffoldMessenger: scaffoldMessenger,
        ),
      ),
    );
  }

  // Convenience methods for different types
  static void showSuccess({
    required BuildContext context,
    required String message,
    String? actionText,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 4),
  }) {
    show(
      context: context,
      message: message,
      type: SnackbarType.success,
      actionText: actionText,
      onActionPressed: onActionPressed,
      duration: duration,
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
    String? actionText,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 6),
  }) {
    show(
      context: context,
      message: message,
      type: SnackbarType.error,
      actionText: actionText,
      onActionPressed: onActionPressed,
      duration: duration,
    );
  }

  static void showInfo({
    required BuildContext context,
    required String message,
    String? actionText,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 4),
  }) {
    show(
      context: context,
      message: message,
      type: SnackbarType.normal,
      actionText: actionText,
      onActionPressed: onActionPressed,
      duration: duration,
    );
  }
}

class _CustomSnackbarContent extends StatelessWidget {
  final String message;
  final SnackbarType type;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
  final Color iconColor;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final ScaffoldMessengerState scaffoldMessenger;

  const _CustomSnackbarContent({
    required this.message,
    required this.type,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    required this.iconColor,
    this.actionText,
    this.onActionPressed,
    required this.scaffoldMessenger,
  });

  void _closeSnackbar() {
    // Use the stored ScaffoldMessengerState instead of looking it up
    scaffoldMessenger.hideCurrentSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),

          // Message
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Action Button (if provided)
          if (actionText != null && onActionPressed != null) ...[
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                onActionPressed!();
                _closeSnackbar();
              },
              style: TextButton.styleFrom(
                foregroundColor: iconColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                actionText!,
                style: TextStyle(
                  color: iconColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],

          // Close Button
          IconButton(
            onPressed: _closeSnackbar,
            icon: Icon(
              Icons.close,
              color: textColor.withValues(alpha: 0.6),
              size: 18,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
            splashRadius: 16,
          ),
        ],
      ),
    );
  }
}
