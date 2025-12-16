import 'package:flutter/material.dart';
import 'package:throw_user/core/storage/app_storage_functions.dart';
import 'package:throw_user/modules/login_module/view/login_page.dart';
import 'package:throw_user/modules/onboarding_module/models/onboarding_page_data.dart';

class OnboardingHelper {
  final BuildContext context;
  final PageController pageController;
  final ValueNotifier<int> currentPage;
  final List<OnboardingPageData> pages;
  const OnboardingHelper({
    required this.context,
    required this.pageController,
    required this.currentPage,
    required this.pages,
  });

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      completeOnboarding();
    }
  }

  void skipOnboarding() {
    completeOnboarding();
  }

  void completeOnboarding() {
    // First, disable the intro screen for future launches
    AppStorageFunctions.disableIntroScreen()
        .then((_) {
          // Then navigate to login page
          if (!context.mounted) return;
          Navigator.of(context).pushReplacement(LoginPage.route());
        })
        .catchError((error) {
          // Even if storage fails, still navigate to login page
          debugPrint('Error saving onboarding status: $error');
          if (!context.mounted) return;
          Navigator.of(context).pushReplacement(LoginPage.route());
        });
  }
}
