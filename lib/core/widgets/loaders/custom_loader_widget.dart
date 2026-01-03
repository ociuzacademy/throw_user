import 'package:flutter/material.dart';

class CustomLoaderWidget extends StatelessWidget {
  final String? message;
  final Color? color;

  const CustomLoaderWidget({super.key, this.message, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: color ?? theme.colorScheme.primary),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
