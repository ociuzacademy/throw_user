import 'package:flutter/material.dart';
import 'package:throw_user/modules/home_module/widgets/account_item.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isSmallScreen = screenWidth < 600;
    final isVerySmallScreen = screenWidth < 400;

    // Color definitions
    final primaryColor = const Color(0xFF2694ed);
    final backgroundColor = isDark
        ? const Color(0xFF101a22)
        : const Color(0xFFf6f7f8);
    final cardColor = isDark ? const Color(0xFF182430) : Colors.white;
    final textPrimaryColor = isDark
        ? const Color(0xFFf6f7f8)
        : const Color(0xFF111518);
    final textSecondaryColor = isDark
        ? const Color(0xFF9badbd)
        : const Color(0xFF617789);

    // Responsive dimensions
    final horizontalPadding = isSmallScreen ? 16.0 : 24.0;
    final verticalPadding = isSmallScreen ? 16.0 : 24.0;
    final avatarSize = isVerySmallScreen ? 80.0 : 96.0;
    final titleFontSize = isVerySmallScreen ? 20.0 : 24.0;
    final subtitleFontSize = isVerySmallScreen ? 14.0 : 16.0;
    final sectionFontSize = isSmallScreen ? 18.0 : 20.0;
    final sectionSpacing = isSmallScreen ? 20.0 : 28.0;

    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // User Profile Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isSmallScreen ? 20 : 28),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Avatar
                    Container(
                      width: avatarSize,
                      height: avatarSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor.withValues(alpha: 0.1),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuDlb59hn-Rtidgb6REAe3jgXP2t0ULSszRxj-Rqnccc_ycvE24PWhKXuwU2g0tV791nnmgZWOrg4U0_oLgdn71Jgm2h9KQLKUdKwWqAaZay22OlF95p0UjfXl6_5tX0j3TD_L4K_XBRnDkrnSiEtStj-XmSmCAHSZcKthMx_cjypQeaQL60rjWhl_WPmj_tCFFtnxf6T5v_vqB5ERPEZKEngfPK1IBtXcNqizdnxJlyFe3Yr4eqE5A_HFxkOECHCIokzkAhFOvcghrz',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 16 : 20),
                    Text(
                      'Ethan Carter',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: textPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '@ethan.carter',
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        color: textSecondaryColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Joined in 2022',
                      style: TextStyle(
                        fontSize: isVerySmallScreen ? 12 : 14,
                        color: textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: sectionSpacing),

              // Account Section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account',
                        style: TextStyle(
                          fontSize: sectionFontSize,
                          fontWeight: FontWeight.bold,
                          color: textPrimaryColor,
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 16 : 20),
                      AccountItem(
                        icon: Icons.verified_user_outlined,
                        title: 'ID Verification',
                        subtitle: 'Verified',
                        primaryColor: primaryColor,
                        textSecondaryColor: textSecondaryColor,
                        isSmallScreen: isSmallScreen,
                      ),
                      AccountItem(
                        icon: Icons.credit_card_outlined,
                        title: 'Payment Methods',
                        primaryColor: primaryColor,
                        textSecondaryColor: textSecondaryColor,
                        hasArrow: true,
                        isSmallScreen: isSmallScreen,
                      ),
                      AccountItem(
                        icon: Icons.notifications_outlined,
                        title: 'Notifications',
                        primaryColor: primaryColor,
                        textSecondaryColor: textSecondaryColor,
                        hasArrow: true,
                        isSmallScreen: isSmallScreen,
                      ),
                      AccountItem(
                        icon: Icons.settings_outlined,
                        title: 'Settings',
                        primaryColor: primaryColor,
                        textSecondaryColor: textSecondaryColor,
                        hasArrow: true,
                        isSmallScreen: isSmallScreen,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: sectionSpacing),

              // Support Section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Support',
                        style: TextStyle(
                          fontSize: sectionFontSize,
                          fontWeight: FontWeight.bold,
                          color: textPrimaryColor,
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 16 : 20),
                      AccountItem(
                        icon: Icons.help_outline_outlined,
                        title: 'Help Center',
                        primaryColor: primaryColor,
                        textSecondaryColor: textSecondaryColor,
                        hasArrow: true,
                        isSmallScreen: isSmallScreen,
                      ),
                      AccountItem(
                        icon: Icons.chat_bubble_outline_outlined,
                        title: 'Contact Us',
                        primaryColor: primaryColor,
                        textSecondaryColor: textSecondaryColor,
                        hasArrow: true,
                        isSmallScreen: isSmallScreen,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 80), // Space for bottom navigation
            ],
          ),
        ),
      ),
    );
  }
}
