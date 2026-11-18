import 'package:flutter/material.dart';
import 'package:localfix/core/theme/app_colors.dart';
import 'package:localfix/core/theme/app_spacing.dart';
import 'package:localfix/core/theme/app_text_styles.dart';

import '../../domain/entities/service_category_entity.dart';

class ServiceCategoryCard extends StatelessWidget {
  final ServiceCategoryEntity category;

  ServiceCategoryCard({super.key, required this.category});

  IconData _getIcon(String name) {
    switch (name.toLowerCase()) {
      case 'electrical':
        return Icons.electrical_services_rounded;
      case 'plumbing':
        return Icons.plumbing_rounded;
      case 'cleaning':
        return Icons.cleaning_services_rounded;
      case 'carpentry':
        return Icons.handyman_rounded;
      case 'tutor':
        return Icons.school_rounded;
      case 'mechanic':
        return Icons.car_repair_rounded;
      case 'appliance repair':
        return Icons.home_repair_service_rounded;
      case 'painting':
        return Icons.format_paint_rounded;
      default:
        return Icons.home_repair_service_rounded;
    }
  }

  final Map<String, Color> categoryColors = {
    'plumbing': const Color(0xFF2563EB),
    'electrical': const Color(0xFFD97706),
    'carpentry': const Color(0xFF9333EA),
    'painting': const Color(0xFFDB2777),
    'appliance_repair': const Color(0xFF16A34A),
  };

  final Map<String, Color> backgroundColors = {
    'plumbing': const Color(0xFFE8F1FF),
    'electrical': const Color(0xFFFFF4DB),
    'carpentry': const Color(0xFFF3E8FF),
    'painting': const Color(0xFFFCE7F3),
    'appliance_repair': const Color(0xFFDCFCE7),
  };

  @override
  Widget build(BuildContext context) {
    final key = category.name.toLowerCase().replaceAll(' ', '_');
    final iconColor = categoryColors[key] ?? AppColors.darkInfo;
    final backgroundColor = backgroundColors[key] ?? const Color(0xFFEAF1FF);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(_getIcon(category.name), color: iconColor, size: 30),
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        Text(
          category.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.titleSmall,
        ),
      ],
    );
  }
}
