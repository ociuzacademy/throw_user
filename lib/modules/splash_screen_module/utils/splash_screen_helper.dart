class SplashScreenHelper {
  static double getLogoSize(double screenWidth) {
    if (screenWidth < 375) return 96; // Small phones
    if (screenWidth < 600) return 128; // Normal phones
    if (screenWidth < 900) return 160; // Large phones/small tablets
    return 200; // Tablets and larger
  }

  static double getAppNameFontSize(double screenWidth) {
    if (screenWidth < 375) return 28;
    if (screenWidth < 600) return 36;
    if (screenWidth < 900) return 42;
    return 48;
  }

  static double getTaglineFontSize(double screenWidth) {
    if (screenWidth < 375) return 14;
    if (screenWidth < 600) return 16;
    if (screenWidth < 900) return 18;
    return 20;
  }

  static double getPadding(double screenWidth) {
    if (screenWidth < 375) return 12;
    if (screenWidth < 600) return 16;
    if (screenWidth < 900) return 20;
    return 24;
  }

  static double getSpacing(double screenWidth) {
    if (screenWidth < 375) return 6;
    if (screenWidth < 600) return 8;
    if (screenWidth < 900) return 10;
    return 12;
  }

  static double getBounceDistance(double screenHeight) {
    if (screenHeight < 600) return 60; // Small screens
    if (screenHeight < 800) return 80; // Normal screens
    if (screenHeight < 1000) return 100; // Large screens
    return 120; // Very large screens
  }

  static double getProgressBarHeight(double screenWidth) {
    if (screenWidth < 375) return 1.5;
    if (screenWidth < 600) return 2;
    if (screenWidth < 900) return 2.5;
    return 3;
  }
}
