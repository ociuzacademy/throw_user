import 'dart:io';

import 'package:flutter/material.dart';
import 'package:throw_user/core/widgets/text_field/unified_text_field.dart';
import 'package:throw_user/modules/profile_setup_module/utils/profile_setup_helper.dart';
import 'package:throw_user/modules/profile_setup_module/widgets/continue_button.dart';
import 'package:throw_user/modules/profile_setup_module/widgets/profile_image_section.dart';

class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();

  static Route route() =>
      MaterialPageRoute(builder: (context) => const ProfileSetupPage());
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  late final ProfileSetupHelper _profileSetupHelper;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<File?> _profileImage = ValueNotifier<File?>(null);
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _profileSetupHelper = ProfileSetupHelper(
      context: context,
      formKey: _formKey,
      fullNameController: _fullNameController,
      phoneNumberController: _phoneNumberController,
      emailController: _emailController,
      passwordController: _passwordController,
      profileImage: _profileImage,
      isLoading: _isLoading,
      isPasswordVisible: _isPasswordVisible,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLargeScreen = screenSize.width >= 600;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Color definitions
    final backgroundColor = isDark
        ? const Color(0xFF101a22)
        : const Color(0xFFf6f7f8);
    final cardColor = isDark ? const Color(0xFF182430) : Colors.white;
    final textPrimaryColor = isDark
        ? const Color(0xFFf6f7f8)
        : const Color(0xFF111518);

    // Responsive padding calculations
    final horizontalPadding = ProfileSetupHelper.getResponsivePadding(
      screenSize.width,
    );
    final verticalPadding = ProfileSetupHelper.getResponsiveVerticalPadding(
      screenSize.height,
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: cardColor,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        centerTitle: true,
        title: Text(
          'Profile Setup',
          style: TextStyle(
            fontSize: _getTitleFontSize(screenSize.width),
            fontWeight: FontWeight.bold,
            color: textPrimaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    screenSize.height -
                    (kToolbarHeight + verticalPadding * 2 + 100),
              ),
              child: Column(
                children: [
                  // Profile Photo Section
                  ValueListenableBuilder(
                    valueListenable: _profileImage,
                    builder: (context, profileImage, child) {
                      return ProfileImageSection(
                        isDark: isDark,
                        screenWidth: screenSize.width,
                        profileImagePath: profileImage?.path,
                        onUploadPressed: _profileSetupHelper.pickImage,
                      );
                    },
                  ),

                  SizedBox(height: isLargeScreen ? 32 : 24),

                  // Form Section
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: isLargeScreen ? 500 : double.infinity,
                    ),
                    child: Column(
                      children: [
                        // Full Name Field
                        UnifiedTextField(
                          controller: _fullNameController,
                          hintText: 'Full Name',
                          screenWidth: screenSize.width,
                          isDark: isDark,
                          style: TextFieldStyle.profile,
                          keyboardType: TextInputType.name,
                          validator: ProfileSetupHelper.validateFullName,
                        ),
                        SizedBox(
                          height: ProfileSetupHelper.getFieldSpacing(
                            screenSize.width,
                          ),
                        ),

                        // Phone Number Field
                        UnifiedTextField(
                          controller: _phoneNumberController,
                          hintText: 'Phone Number',
                          screenWidth: screenSize.width,
                          isDark: isDark,
                          style: TextFieldStyle.profile,
                          keyboardType: TextInputType.phone,
                          validator: ProfileSetupHelper.validatePhoneNumber,
                        ),
                        SizedBox(
                          height: ProfileSetupHelper.getFieldSpacing(
                            screenSize.width,
                          ),
                        ),

                        // Email Address Field
                        UnifiedTextField(
                          controller: _emailController,
                          hintText: 'Email Address',
                          screenWidth: screenSize.width,
                          isDark: isDark,
                          style: TextFieldStyle.profile,
                          keyboardType: TextInputType.emailAddress,
                          validator: ProfileSetupHelper.validateEmail,
                        ),
                        SizedBox(
                          height: ProfileSetupHelper.getFieldSpacing(
                            screenSize.width,
                          ),
                        ),

                        // Password Field
                        ValueListenableBuilder<bool>(
                          valueListenable: _isPasswordVisible,
                          builder: (context, isVisible, child) {
                            return UnifiedTextField(
                              controller: _passwordController,
                              hintText: 'Password',
                              screenWidth: screenSize.width,
                              isDark: isDark,
                              style: TextFieldStyle.profile,
                              obscureText: !isVisible,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: isDark
                                      ? const Color(0xFFa0b3c4)
                                      : const Color(0xFF4c779a),
                                ),
                                onPressed: () =>
                                    _isPasswordVisible.value = !isVisible,
                              ),
                              validator: ProfileSetupHelper.validatePassword,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // Footer Button
      bottomNavigationBar: ValueListenableBuilder<bool>(
        valueListenable: _isLoading,
        builder: (context, isLoading, child) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: ContinueButton(
              screenWidth: screenSize.width,
              isLoading: isLoading,
              onPressed: _profileSetupHelper.submitForm,
            ),
          );
        },
      ),
    );
  }

  double _getTitleFontSize(double screenWidth) {
    if (screenWidth < 375) return 18;
    if (screenWidth < 600) return 20;
    if (screenWidth < 900) return 22;
    return 24;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _profileImage.dispose();
    _isLoading.dispose();
    _isPasswordVisible.dispose();
    super.dispose();
  }
}
