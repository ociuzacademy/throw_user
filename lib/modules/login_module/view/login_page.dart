import 'package:flutter/material.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/core/widgets/text_field/unified_text_field.dart';
import 'package:throw_user/modules/login_module/utils/login_helper.dart';
import 'package:throw_user/modules/login_module/widgets/custom_button.dart';
import 'package:throw_user/modules/login_module/widgets/welcome_section.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  static Route route() =>
      MaterialPageRoute(builder: (context) => const LoginPage());
}

class _LoginPageState extends State<LoginPage> {
  late final LoginHelper _loginHelper;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _loginHelper = LoginHelper(
      context: context,
      loginFormKey: _loginFormKey,
      emailController: _emailController,
      passwordController: _passwordController,
      isPasswordVisible: _isPasswordVisible,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 375;
    final isLargeScreen = screenSize.width > 600;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Color definitions based on HTML
    final primaryColor = AppColors.primary;
    final backgroundLight = AppColors.backgroundLight;
    final backgroundDark = AppColors.backgroundDark;
    final cardLight = AppColors.cardLight;
    final cardDark = AppColors.cardDark;
    final textPrimaryLight = AppColors.textPrimaryLight;
    final textPrimaryDark = AppColors.textPrimaryDark;
    final textSecondaryLight = AppColors.textSecondaryLight;
    final textSecondaryDark = AppColors.textSecondaryDark;

    final backgroundColor = isDark ? backgroundDark : backgroundLight;
    final textPrimaryColor = isDark ? textPrimaryDark : textPrimaryLight;
    final textSecondaryColor = isDark ? textSecondaryDark : textSecondaryLight;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? cardDark : cardLight,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),

        centerTitle: true,
        title: Text(
          'Throw',
          style: TextStyle(
            fontSize: isSmallScreen ? 20 : 24,
            fontWeight: FontWeight.bold,
            color: textPrimaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Welcome Section
                WelcomeSection(
                  isSmallScreen: isSmallScreen,
                  textPrimaryColor: textPrimaryColor,
                  textSecondaryColor: textSecondaryColor,
                ),

                SizedBox(height: isSmallScreen ? 24 : 32),

                // Input Section
                Container(
                  constraints: BoxConstraints(
                    maxWidth: isLargeScreen
                        ? 400
                        : isSmallScreen
                        ? double.infinity
                        : 300,
                  ),
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        // Email Field
                        UnifiedTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          screenWidth: screenSize.width,
                          isDark: isDark,
                          style: TextFieldStyle.delivery,
                          validator: _loginHelper.validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          textPrimaryColor: textPrimaryColor,
                          textSecondaryColor: textSecondaryColor,
                        ),

                        SizedBox(height: isSmallScreen ? 12 : 16),

                        // Password Field
                        ValueListenableBuilder(
                          valueListenable: _isPasswordVisible,
                          builder: (context, isPasswordVisible, child) {
                            return UnifiedTextField(
                              controller: _passwordController,
                              hintText: 'Password',
                              screenWidth: screenSize.width,
                              isDark: isDark,
                              style: TextFieldStyle.delivery,
                              obscureText: !isPasswordVisible,
                              validator: _loginHelper.validatePassword,
                              textPrimaryColor: textPrimaryColor,
                              textSecondaryColor: textSecondaryColor,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: textSecondaryColor,
                                ),
                                onPressed:
                                    _loginHelper.togglePasswordVisibility,
                              ),
                            );
                          },
                        ),

                        SizedBox(height: isSmallScreen ? 20 : 24),

                        // Continue Button
                        CustomButton(
                          text: 'Continue',
                          onPressed: _loginHelper.handleLogin,
                          isSmallScreen: isSmallScreen,
                          primaryColor: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _isPasswordVisible.dispose();
    super.dispose();
  }
}
