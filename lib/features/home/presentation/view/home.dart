import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localfix/core/theme/app_spacing.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widget/home_header.dart';
import '../widget/home_search_bar.dart';
import '../widget/popular_services_section.dart.dart';
import '../widget/searched_result_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeStarted());
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _search(String query) {
    if (query.trim().isEmpty) {
      context.read<HomeBloc>().add(SearchCleared());
      return;
    }

    context.read<HomeBloc>().add(SearchPressed(query.trim()));
  }

  void _clearSearch() {
    searchController.clear();
    context.read<HomeBloc>().add(SearchCleared());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial || state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFF0066FF)),
              );
            }

            if (state is HomeError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(height: 12),
                      Text(state.message, textAlign: TextAlign.center),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(HomeStarted());
                        },
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is HomeLoaded) {
              return RefreshIndicator(
                color: const Color(0xFF0066FF),
                onRefresh: () async {
                  context.read<HomeBloc>().add(HomeStarted());
                },
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  children: [
                    HomeHeader(userName: state.userName),

                    const SizedBox(height: 28),

                    HomeSearchBar(
                      controller: searchController,
                      isSearching: state.isSearching,
                      onSubmitted: _search,
                      onClear: _clearSearch,
                    ),

                    const SizedBox(height: AppSpacing.sm),

                    if (searchController.text.trim().isNotEmpty) ...[
                      SearchResultsSection(
                        results: state.searchResults,
                        isSearching: state.isSearching,
                        error: state.searchError,
                      ),
                    ] else ...[
                      PopularServicesSection(categories: state.categories),
                    ],
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
