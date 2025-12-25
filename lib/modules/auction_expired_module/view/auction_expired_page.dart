import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/modules/home_module/view/home_page.dart';

class AuctionExpiredPage extends StatelessWidget {
  const AuctionExpiredPage({super.key});

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const AuctionExpiredPage());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    // Color definitions based on the HTML
    // Color definitions based on the HTML
    const primaryColor = AppColors.primary;
    const backgroundLight = AppColors.backgroundLight;
    const backgroundDark = AppColors.backgroundDark;
    const foregroundLight = AppColors.textPrimaryLight;
    const foregroundDark = AppColors.textPrimaryDark;
    const cardLight = AppColors.cardLight;
    const cardDark = AppColors.cardDark;
    const subtleLight = AppColors.borderLight;
    const subtleDark = AppColors.borderDark;
    const mutedLight = AppColors.textSecondaryLight;
    const mutedDark = AppColors.textSecondaryDark;

    // Responsive dimensions
    final isSmallScreen = size.width < 375;
    final isLargeScreen = size.width > 600;
    final horizontalPadding = isSmallScreen
        ? 16.0
        : isLargeScreen
        ? 32.0
        : 24.0;
    final verticalPadding = isSmallScreen
        ? 20.0
        : isLargeScreen
        ? 32.0
        : 24.0;
    final cardMaxWidth = size.width * 0.9 > 400 ? 400.0 : size.width * 0.9;
    final iconSize = isSmallScreen
        ? 32.0
        : isLargeScreen
        ? 48.0
        : 40.0;
    final iconContainerSize = isSmallScreen
        ? 48.0
        : isLargeScreen
        ? 80.0
        : 64.0;
    final titleFontSize = isSmallScreen
        ? 20.0
        : isLargeScreen
        ? 28.0
        : 24.0;
    final bodyFontSize = isSmallScreen
        ? 14.0
        : isLargeScreen
        ? 18.0
        : 16.0;
    final buttonFontSize = isSmallScreen ? 14.0 : 16.0;
    final buttonVerticalPadding = isSmallScreen ? 12.0 : 16.0;
    final buttonHorizontalPadding = isSmallScreen ? 16.0 : 20.0;

    return Scaffold(
      backgroundColor: isDark ? backgroundDark : backgroundLight,
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: padding.top + 16,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            decoration: BoxDecoration(
              color: isDark ? cardDark : cardLight,
              border: Border(
                bottom: BorderSide(color: isDark ? subtleDark : subtleLight),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Back button
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: isDark ? foregroundDark : foregroundLight,
                      size: isSmallScreen ? 20.0 : 24.0,
                    ),
                  ),
                ),
                // Title
                Text(
                  'Auction Expired',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16.0 : 18.0,
                    fontWeight: FontWeight.bold,
                    color: isDark ? foregroundDark : foregroundLight,
                  ),
                ),
              ],
            ),
          ),

          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Card
                    Container(
                      width: double.infinity,
                      constraints: BoxConstraints(maxWidth: cardMaxWidth),
                      padding: EdgeInsets.all(isSmallScreen ? 20.0 : 32.0),
                      decoration: BoxDecoration(
                        color: isDark ? cardDark : cardLight,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Icon section
                          Container(
                            margin: EdgeInsets.only(
                              bottom: isSmallScreen ? 16.0 : 24.0,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: iconContainerSize,
                                  height: iconContainerSize,
                                  decoration: BoxDecoration(
                                    color: primaryColor.withValues(
                                      alpha: isDark ? 0.2 : 0.1,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.access_time,
                                    size: iconSize,
                                    color: primaryColor,
                                  ),
                                ),
                                SizedBox(height: isSmallScreen ? 12.0 : 16.0),
                                Text(
                                  'Auction Expired',
                                  style: TextStyle(
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: isDark
                                        ? foregroundDark
                                        : foregroundLight,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: isSmallScreen ? 6.0 : 8.0),
                                Text(
                                  'No deal was finalized for this auction.',
                                  style: TextStyle(
                                    color: isDark ? mutedDark : mutedLight,
                                    fontSize: bodyFontSize,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),

                          // Buttons
                          Column(
                            children: [
                              // Repost button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle repost functionality
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      vertical: buttonVerticalPadding,
                                      horizontal: buttonHorizontalPadding,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    textStyle: TextStyle(
                                      fontSize: buttonFontSize,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: const Text('Repost'),
                                ),
                              ),
                              SizedBox(height: isSmallScreen ? 8.0 : 12.0),

                              // Cancel button
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    // Handle cancel functionality
                                    Navigator.of(context).pushAndRemoveUntil(
                                      HomePage.route(),
                                      (route) => false,
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: isDark
                                        ? mutedDark
                                        : mutedLight,
                                    padding: EdgeInsets.symmetric(
                                      vertical: buttonVerticalPadding,
                                      horizontal: buttonHorizontalPadding,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    textStyle: TextStyle(
                                      fontSize: buttonFontSize,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: const Text('Cancel'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Additional responsive spacing for very large screens
                    if (isLargeScreen) SizedBox(height: size.height * 0.1),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
