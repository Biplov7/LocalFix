import 'package:flutter/material.dart';
import 'package:localfix/core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  final String userName;

  const HomeHeader({super.key, required this.userName});

  String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    final initial = userName.isNotEmpty ? userName[0].toUpperCase() : 'U';
    final firstName = userName.split(' ')[0];
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFFE5EFFF),
          child: Text(
            initial,
            style: const TextStyle(
              color: Color(0xFF0066FF),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: const TextStyle(
                  color: AppColors.darkTextSecondary,
                  fontSize: 13,
                ),
              ),
              Text(
                firstName,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkInfo,
                ),
              ),
            ],
          ),
        ),

        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: Color(0xFF172B4D),
          ),
        ),
      ],
    );
  }
}
