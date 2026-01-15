import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/exports/bloc_exports.dart';
import 'package:throw_user/core/widgets/custom_error_widget.dart';
import 'package:throw_user/modules/home_module/utils/profile_widget_helper.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late final ProfileWidgetHelper _profileWidgetHelper;
  @override
  void initState() {
    super.initState();
    _profileWidgetHelper = ProfileWidgetHelper(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileWidgetHelper.userProfileInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isSmallScreen = screenWidth < 600;
    final isVerySmallScreen = screenWidth < 400;

    // Color definitions
    const primaryColor = AppColors.primary;
    final backgroundColor = AppColors.getBackgroundColor(isDark);
    final cardColor = AppColors.getCardColor(isDark);
    final textPrimaryColor = AppColors.getTextPrimaryColor(isDark);
    final textSecondaryColor = AppColors.getTextSecondaryColor(isDark);

    // Responsive dimensions
    final horizontalPadding = isSmallScreen ? 16.0 : 24.0;
    final verticalPadding = isSmallScreen ? 16.0 : 24.0;
    final avatarSize = isVerySmallScreen ? 80.0 : 96.0;
    final titleFontSize = isVerySmallScreen ? 20.0 : 24.0;
    final subtitleFontSize = isVerySmallScreen ? 14.0 : 16.0;
    // final sectionFontSize = isSmallScreen ? 18.0 : 20.0;
    final sectionSpacing = isSmallScreen ? 20.0 : 28.0;

    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        return switch (state) {
          UserProfileInitial() => const SizedBox.shrink(),
          UserProfileLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          UserProfileSuccess(:final userProfile) => Container(
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
                          // Top row: avatar + details + edit
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Avatar
                              Container(
                                width: avatarSize,
                                height: avatarSize,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primaryColor.withValues(alpha: 0.1),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      userProfile.photoUrl,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              SizedBox(width: isSmallScreen ? 12 : 16),

                              // Name and contact info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userProfile.displayName,
                                      style: TextStyle(
                                        fontSize: titleFontSize,
                                        fontWeight: FontWeight.bold,
                                        color: textPrimaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '@${userProfile.displayName}',
                                      style: TextStyle(
                                        fontSize: subtitleFontSize,
                                        color: textSecondaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.email_outlined,
                                          size: 14,
                                          color: textSecondaryColor,
                                        ),
                                        const SizedBox(width: 6),
                                        Flexible(
                                          child: Text(
                                            userProfile.email,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: textSecondaryColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone_outlined,
                                          size: 14,
                                          color: textSecondaryColor,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          userProfile.phoneNumber.isEmpty
                                              ? 'No phone number'
                                              : userProfile.phoneNumber,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: textSecondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: isSmallScreen ? 16 : 20),

                          // Quick stats row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '0',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: textPrimaryColor,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Requests',
                                        style: TextStyle(
                                          color: textSecondaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '₹0',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: textPrimaryColor,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Wallet',
                                        style: TextStyle(
                                          color: textSecondaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: isSmallScreen ? 12 : 16),

                          // Action buttons
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Logout'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: sectionSpacing),
                  ],
                ),
              ),
            ),
          ),
          UserProfileError(:final message) => CustomErrorWidget(
            errorMessage: message,
            isDark: isDark,
            onRetry: _profileWidgetHelper.userProfileInit,
          ),
        };
      },
    );
  }
}
