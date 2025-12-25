import 'package:flutter/material.dart';
import 'package:throw_user/modules/feedback_module/utils/feedback_helper.dart';
import 'package:throw_user/core/constants/app_colors.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  static Route<void> route() =>
      MaterialPageRoute(builder: (_) => const FeedbackPage());

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  late final FeedbackHelper _feedbackHelper;
  final ValueNotifier<int> _selectedRating = ValueNotifier<int>(0);
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _feedbackHelper = FeedbackHelper(
      context: context,
      selectedRating: _selectedRating,
      commentController: _commentController,
    );
  }

  @override
  void dispose() {
    _selectedRating.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final isSmallScreen = mediaQuery.size.width < 600;

    final backgroundColor = AppColors.getBackgroundColor(isDark);
    final foregroundColor = AppColors.getTextPrimaryColor(isDark);
    final subtleColor = isDark ? AppColors.borderDark : AppColors.borderLight;
    final mutedColor = isDark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;

    // Responsive dimensions
    final horizontalPadding = isSmallScreen ? 16.0 : 24.0;
    final cardPadding = isSmallScreen ? 16.0 : 24.0;
    final titleFontSize = isSmallScreen ? 18.0 : 20.0;
    final spacing = isSmallScreen ? 16.0 : 24.0;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: foregroundColor,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Feedback',
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: foregroundColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(horizontalPadding),
          child: Column(
            children: [
              SizedBox(height: spacing),

              // Order ID Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(cardPadding),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Order #12345',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: foregroundColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing),

              // Rating Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(cardPadding),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rate your experience',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: foregroundColor,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Star Rating with ValueListenableBuilder
                    ValueListenableBuilder<int>(
                      valueListenable: _selectedRating,
                      builder: (context, rating, child) {
                        return Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return GestureDetector(
                                onTap: () =>
                                    _feedbackHelper.updateRating(index + 1),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  child: Icon(
                                    Icons.star,
                                    size: 40,
                                    color: index < rating
                                        ? AppColors.primary
                                        : mutedColor,
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing),

              // Comment Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(cardPadding),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add a comment',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: foregroundColor,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Comment Text Field
                    Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: subtleColor, width: 1),
                      ),
                      child: TextField(
                        controller: _commentController,
                        maxLines: 5,
                        minLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Write your feedback here...',
                          hintStyle: TextStyle(color: mutedColor),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(16),
                        ),
                        style: TextStyle(color: foregroundColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing * 1.5),

              // Submit Button with ValueListenableBuilder for enabling/disabling
              ValueListenableBuilder<Object?>(
                valueListenable: _selectedRating,
                builder: (context, _, child) {
                  final hasRating = _selectedRating.value > 0;
                  final hasComment = _commentController.text.trim().isNotEmpty;

                  // Enable button if either rating or comment is provided
                  final isEnabled = hasRating || hasComment;

                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: ElevatedButton(
                      onPressed: isEnabled
                          ? _feedbackHelper.submitFeedback
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        elevation: isEnabled ? 4 : 0,
                        shadowColor: isEnabled
                            ? AppColors.primary.withValues(alpha: 0.3)
                            : Colors.transparent,
                      ),
                      child: const Text(
                        'Submit Feedback',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: spacing),
            ],
          ),
        ),
      ),
    );
  }
}
