
import 'package:flutter/material.dart';
import '../../domain/entities/search_result_entity.dart';

class SearchResultsSection extends StatelessWidget {
  final List<SearchResultEntity> results;
  final bool isSearching;
  final String? error;

  const SearchResultsSection({
    super.key,
    required this.results,
    required this.isSearching,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Search Results',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color(0xFF172B4D),
          ),
        ),

        const SizedBox(height: 16),

        if (error != null)
          Text(
            error!,
            style: const TextStyle(color: Colors.red),
          )
        else if (isSearching)
          const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF0066FF),
            ),
          )
        else if (results.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text('No matching services found.'),
            ),
          )
        else
          ...results.map(
            (result) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFFEDF0F5),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.home_repair_service_rounded,
                    color: Color(0xFF0066FF),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          result.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          result.subTitle,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
