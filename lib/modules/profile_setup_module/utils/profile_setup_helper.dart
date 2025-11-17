// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:throw_user/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_user/modules/login_module/view/login_page.dart';

class ProfileSetupHelper {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final ValueNotifier<File?> profileImage;
  final ValueNotifier<bool> isLoading;
  final ValueNotifier<bool> isPasswordVisible;

  const ProfileSetupHelper({
    required this.context,
    required this.formKey,
    required this.fullNameController,
    required this.phoneNumberController,
    required this.emailController,
    required this.passwordController,
    required this.profileImage,
    required this.isLoading,
    required this.isPasswordVisible,
  });

  Future<void> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    try {
      final XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 512,
        maxHeight: 512,
      );

      if (image != null) {
        profileImage.value = File(image.path);
      }
    } catch (e) {
      // Handle error (you can show a snackbar or dialog here)
      debugPrint('Error picking image: $e');
    }
  }

  void submitForm() async {
    if (formKey.currentState!.validate()) {
      if (profileImage.value != null) {
        isLoading.value = true;

        // Simulate API call
        await Future.delayed(const Duration(seconds: 2));
        isLoading.value = false;

        final String fullName = fullNameController.text.trim();
        final String phoneNumber = phoneNumberController.text.trim();
        final String email = emailController.text.trim();
        final String password = passwordController.text.trim();

        debugPrint('Full name: $fullName');
        debugPrint('Phone number: $phoneNumber');
        debugPrint('Email: $email');
        debugPrint('Password: $password');

        if (!context.mounted) return;
        CustomSnackbar.showSuccess(
          context: context,
          message: 'Profile set up successfully!',
        );

        Navigator.pushAndRemoveUntil(context, LoginPage.route(), (_) => false);
      } else {
        if (!context.mounted) return;
        CustomSnackbar.showError(
          context: context,
          message: 'Please upload the profile image.',
        );
      }
    } else {
      CustomSnackbar.showError(
        context: context,
        message: 'Please fill all the required form fields',
      );
    }
  }

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    final phoneRegex = RegExp(r'^[0-9]{10,}$');
    final cleanedValue = value.replaceAll(RegExp(r'[-\s()]'), '');
    if (!phoneRegex.hasMatch(cleanedValue)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static double getResponsivePadding(double screenWidth) {
    if (screenWidth < 375) return 16;
    if (screenWidth < 600) return 24;
    if (screenWidth < 900) return 32;
    return 48;
  }

  static double getResponsiveVerticalPadding(double screenHeight) {
    if (screenHeight < 700) return 16;
    if (screenHeight < 900) return 20;
    return 24;
  }

  static double getFieldSpacing(double screenWidth) {
    if (screenWidth < 375) return 12;
    if (screenWidth < 600) return 16;
    return 20;
  }

  static double getButtonPadding(double screenWidth) {
    if (screenWidth < 375) return 16;
    if (screenWidth < 600) return 20;
    if (screenWidth < 900) return 24;
    return 28;
  }

  static double getButtonHeight(double screenWidth) {
    if (screenWidth < 375) return 48;
    if (screenWidth < 600) return 52;
    if (screenWidth < 900) return 56;
    return 60;
  }

  static double getFontSize(double screenWidth) {
    if (screenWidth < 375) return 15;
    if (screenWidth < 600) return 16;
    if (screenWidth < 900) return 17;
    return 18;
  }
}
