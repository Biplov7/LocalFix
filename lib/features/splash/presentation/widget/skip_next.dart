import 'package:flutter/material.dart';
import 'package:localfix/core/theme/app_colors.dart';
import 'package:localfix/core/theme/app_radius.dart';
import 'package:localfix/core/theme/app_text_styles.dart';

class SkipNext extends StatelessWidget {
  final int currentPage;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  const SkipNext({super.key, required this.currentPage, required this.onNext,required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: onSkip,
            child: Text(
              "Skip",
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.info,
              ),
            ),
          ),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkInfo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
              ),
              onPressed: onNext,
              child: Text(
                "Next",
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.lightCard,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
