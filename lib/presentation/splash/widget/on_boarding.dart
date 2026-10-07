import 'package:flutter/material.dart';
import 'package:localfix/core/theme/app_colors.dart';
import 'package:localfix/core/theme/app_spacing.dart';
import 'package:localfix/core/theme/app_text_styles.dart';
import 'package:localfix/presentation/splash/widget/skip_next.dart';
import 'package:localfix/presentation/splash/widget/triple_dot.dart';

class Onboarding extends StatelessWidget {
  final String image;
  final String mainText;
  final String secondaryText;
  final int selectedIndex;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  const Onboarding({
    super.key,
    required this.image,
    required this.mainText,
    required this.secondaryText,
    required this.selectedIndex,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.77,
                  decoration: BoxDecoration(),
                  child: Image.asset(image),
                ),
                SizedBox(height: AppSpacing.huge),

                Text(
                  mainText,
                  style: AppTextStyles.headingMedium.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: AppSpacing.md),
                Text(
                  secondaryText,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.darkTextDisabled,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.huge),
            Column(
              children: [
                TripleDot(isSelected: selectedIndex),
                SizedBox(height: AppSpacing.xl),
                SkipNext(
                  currentPage: selectedIndex,
                  onNext: onNext,
                  onSkip: onSkip,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
