import 'package:flutter/material.dart';
import 'package:localfix/core/theme/app_colors.dart';

class TripleDot extends StatelessWidget {
  final int isSelected;
  const TripleDot({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.02,
              width: isSelected == index
                  ? MediaQuery.of(context).size.width * 0.025
                  : MediaQuery.of(context).size.width * 0.02,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected == index
                    ? AppColors.info
                    : AppColors.darkTextSecondary,
              ),
            ),
          );
        }),
      ),
    );
  }
}
