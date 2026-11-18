import 'package:flutter/material.dart';
import 'package:localfix/core/theme/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final bool isSearching;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onClear;

  const HomeSearchBar({
    super.key,
    required this.controller,
    required this.isSearching,
    required this.onSubmitted,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            textInputAction: TextInputAction.search,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search, color: AppColors.darkTextDisabled),
              hintText: 'Search electrician,plumber,cleaner,...',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              border: InputBorder.none,
            ),
          ),
        ),

        if (isSearching)
          const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Color(0xFF0066FF),
            ),
          )
        else if (controller.text.isNotEmpty)
          GestureDetector(
            onTap: onClear,
            child: const Icon(Icons.close_rounded, color: Colors.grey),
          ),
      ],
    );
  }
}
