import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/modules/onboarding_module/models/onboarding_page_data.dart';
import 'package:throw_user/modules/onboarding_module/utils/onboarding_helper.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => const OnboardingPage());
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final OnboardingHelper _onboardingHelper;
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  static const List<OnboardingPageData> _pages = [
    OnboardingPageData(
      icon: Icons.rocket_launch,
      title: 'Lightning Fast Delivery',
      description:
          'Connect with nearby delivery agents and get your packages delivered in record time with real-time tracking.',
    ),
    OnboardingPageData(
      icon: Icons.price_change,
      title: 'Smart Bargaining',
      description:
          'Our intelligent bidding system lets you negotiate delivery prices in real-time with multiple trusted agents.',
    ),
    OnboardingPageData(
      icon: Icons.shield,
      title: 'Safe Escrow Payments',
      description:
          'Rest easy knowing your payment is protected. Funds are only released after you confirm successful delivery.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _onboardingHelper = OnboardingHelper(
      context: context,
      pageController: _pageController,
      currentPage: _currentPage,
      pages: _pages,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isVerySmallScreen = screenWidth < 400;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    // Responsive dimensions
    final padding = isVerySmallScreen ? 16.0 : 24.0;
    final iconContainerSize = isVerySmallScreen ? 80.0 : 120.0;
    final iconSize = isVerySmallScreen ? 40.0 : 64.0;
    final titleFontSize = isVerySmallScreen ? 22.0 : 28.0;
    final descriptionFontSize = isVerySmallScreen ? 14.0 : 16.0;
    final buttonFontSize = isVerySmallScreen ? 14.0 : 16.0;
    final buttonVerticalPadding = isVerySmallScreen ? 12.0 : 16.0;
    final buttonHorizontalPadding = isVerySmallScreen ? 20.0 : 24.0;

    // Spacing adjustments
    final iconSpacing = isVerySmallScreen ? 20.0 : 32.0;
    final titleSpacing = isVerySmallScreen ? 12.0 : 16.0;
    final dotsSpacing = isVerySmallScreen ? 20.0 : 32.0;
    final buttonSpacing = isVerySmallScreen ? 8.0 : 12.0;

    // Layout adjustments for landscape
    final pageViewFlex = isLandscape ? 3 : 4;
    final bottomSectionFlex = isLandscape ? 1 : 2;

    // Color definitions
    // Color definitions
    const primaryColor = AppColors.primary;
    const backgroundLight = AppColors.backgroundLight;
    const backgroundDark = AppColors.backgroundDark;

    return Scaffold(
      backgroundColor: isDark ? backgroundDark : backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: ValueListenableBuilder(
            valueListenable: _currentPage,
            builder: (context, currentPage, child) {
              return Column(
                children: [
                  // PageView for onboarding screens - Flexible for landscape
                  Expanded(
                    flex: pageViewFlex,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _pages.length,
                      onPageChanged: (index) {
                        _currentPage.value = index;
                      },
                      itemBuilder: (context, index) {
                        final page = _pages[index];
                        return Column(
                          mainAxisAlignment: isLandscape
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center,
                          children: [
                            if (isLandscape)
                              SizedBox(height: isVerySmallScreen ? 20 : 40),
                            // Icon container
                            Container(
                              padding: EdgeInsets.all(
                                isVerySmallScreen ? 16 : 24,
                              ),
                              width: iconContainerSize,
                              height: iconContainerSize,
                              decoration: BoxDecoration(
                                color: primaryColor.withValues(
                                  alpha: isDark ? 0.2 : 0.1,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                page.icon,
                                size: iconSize,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(height: iconSpacing),
                            // Title
                            Text(
                              page.title,
                              style: TextStyle(
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold,
                                color: isDark
                                    ? backgroundLight
                                    : backgroundDark,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: titleSpacing),
                            // Description
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: isVerySmallScreen ? 8 : 16,
                              ),
                              child: Text(
                                page.description,
                                style: TextStyle(
                                  fontSize: descriptionFontSize,
                                  color: isDark
                                      ? backgroundLight.withValues(alpha: 0.7)
                                      : backgroundDark.withValues(alpha: 0.7),
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: isLandscape ? 2 : 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  // Bottom section with dots and buttons - Flexible for landscape
                  Expanded(
                    flex: bottomSectionFlex,
                    child: Column(
                      mainAxisAlignment: isLandscape
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.end,
                      children: [
                        // Progress dots
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(_pages.length, (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(
                                horizontal: isVerySmallScreen ? 2 : 4,
                              ),
                              width: index == currentPage
                                  ? (isVerySmallScreen ? 16 : 20)
                                  : (isVerySmallScreen ? 6 : 10),
                              height: isVerySmallScreen ? 6 : 10,
                              decoration: BoxDecoration(
                                color: index == currentPage
                                    ? primaryColor
                                    : primaryColor.withValues(
                                        alpha: isDark ? 0.3 : 0.2,
                                      ),
                                borderRadius: BorderRadius.circular(
                                  isVerySmallScreen ? 3 : 5,
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: dotsSpacing),

                        // Buttons - Fixed layout that doesn't shift
                        Column(
                          children: [
                            // Next/Get Started button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _onboardingHelper.nextPage,
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
                                  elevation: 4,
                                  shadowColor: primaryColor.withValues(
                                    alpha: 0.2,
                                  ),
                                ),
                                child: Text(
                                  currentPage == _pages.length - 1
                                      ? 'Get Started'
                                      : 'Next',
                                  style: TextStyle(
                                    fontSize: buttonFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: buttonSpacing),

                            // Skip button - Always present but hidden on last page
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity: currentPage < _pages.length - 1
                                  ? 1.0
                                  : 0.0,
                              child: IgnorePointer(
                                ignoring: currentPage >= _pages.length - 1,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextButton(
                                    onPressed: _onboardingHelper.skipOnboarding,
                                    style: TextButton.styleFrom(
                                      foregroundColor: primaryColor,
                                      padding: EdgeInsets.symmetric(
                                        vertical: buttonVerticalPadding,
                                        horizontal: buttonHorizontalPadding,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      'Skip',
                                      style: TextStyle(
                                        fontSize: buttonFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
