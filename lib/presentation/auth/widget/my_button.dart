import 'package:flutter/material.dart';
import 'package:localfix/core/theme/app_radius.dart';
import 'package:localfix/core/theme/app_text_styles.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final Widget? image;
  final VoidCallback onPressed;
  const new({
    super.key,
    required this.buttonText,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.image,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: double.infinity,
      decoration: BoxDecoration(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null) ...[image!, const SizedBox(width: 8)],
            Text(
              buttonText,
              style: AppTextStyles.titleMedium.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
