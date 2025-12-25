// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:throw_user/core/widgets/snackbars/custom_snackbar.dart';

class ProgressStepHelper {
  static Future<bool> shareOtpToWhatsApp(
    BuildContext context,
    String? otp, {
    required String phoneNumber,
  }) async {
    if (otp == null) return false;

    final message = 'Your delivery OTP is: $otp';

    // Format phone number (remove spaces, special characters, etc.)
    String? formattedPhone;
    debugPrint('Phone Number: $phoneNumber');
    formattedPhone = phoneNumber
        .replaceAll(RegExp(r'[+\s\-()]'), '') // Remove +, spaces, -, (, )
        .replaceAll(RegExp(r'^0+'), ''); // Remove leading zeros

    // If it starts with country code like 91 (India), ensure proper format
    if (formattedPhone.startsWith('91') && formattedPhone.length == 12) {
      formattedPhone = formattedPhone;
    }

    // WhatsApp URL formats
    String whatsappUrl;
    String whatsappBusinessUrl;

    debugPrint('Formatted Phone Number: $formattedPhone');
    if (formattedPhone.isNotEmpty) {
      // WhatsApp URL with specific phone number
      whatsappUrl =
          'https://wa.me/$formattedPhone?text=${Uri.encodeComponent(message)}';
      whatsappBusinessUrl =
          'https://api.whatsapp.com/send?phone=$formattedPhone&text=${Uri.encodeComponent(message)}';
    } else {
      // Generic WhatsApp URL (without specific number)
      whatsappUrl = 'https://wa.me/?text=${Uri.encodeComponent(message)}';
      whatsappBusinessUrl =
          'https://api.whatsapp.com/send?text=${Uri.encodeComponent(message)}';
    }

    try {
      // Try regular WhatsApp first
      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        debugPrint(whatsappUrl);
        await launchUrl(
          Uri.parse(whatsappUrl),
          mode: LaunchMode.externalApplication,
        );
        return true; // Successfully shared
      }
      // Try WhatsApp Business as fallback
      else if (await canLaunchUrl(Uri.parse(whatsappBusinessUrl))) {
        await launchUrl(
          Uri.parse(whatsappBusinessUrl),
          mode: LaunchMode.externalApplication,
        );
        return true; // Successfully shared
      }
      // If neither works, show error
      else {
        if (!context.mounted) return false;
        CustomSnackbar.showError(
          context: context,
          message: 'WhatsApp is not installed on your device',
        );
        return false;
      }
    } catch (e) {
      debugPrint('Error: ${e.toString()}');
      if (!context.mounted) return false;
      CustomSnackbar.showError(
        context: context,
        message: 'Failed to open WhatsApp',
      );
      return false;
    }
  }
}
