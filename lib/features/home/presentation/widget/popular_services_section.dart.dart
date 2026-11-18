import 'package:flutter/material.dart';
import 'package:localfix/core/theme/app_spacing.dart';
import 'package:localfix/core/theme/app_text_styles.dart';

import '../../domain/entities/service_category_entity.dart';
import 'service_category_card.dart';

class PopularServicesSection extends StatelessWidget {
  final List<ServiceCategoryEntity> categories;

  const PopularServicesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Services',
          style: AppTextStyles.headingSmall.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        if (categories.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text('No services available right now.'),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return ServiceCategoryCard(category: categories[index]);
            },
          ),
      ],
    );
  }
}
