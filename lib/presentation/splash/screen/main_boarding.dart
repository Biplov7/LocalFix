import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localfix/core/router/app_name.dart';
import 'package:localfix/presentation/splash/widget/on_boarding.dart';

class MainBoarding extends StatefulWidget {
  const MainBoarding({super.key});

  @override
  State<MainBoarding> createState() => _MainBoardingState();
}

class _MainBoardingState extends State<MainBoarding> {
  final PageController _controller = PageController();
  int _selectedIndex = 0;
  void _nextPage() {
    if (_selectedIndex < 2) {
      _controller.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    } else {
      context.goNamed(AppName.loginName);
    }
  }

  void _onSkip() {
    context.goNamed(AppName.loginName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        children: [
          Onboarding(
            image: 'assets/images/local_onboarding.png',
            mainText: "Find Local Services",
            secondaryText: "Search for electricians, plumbers, cleaners,\n carpenters, tutors, mechanics\n and other professionals",
            selectedIndex: _selectedIndex,
            onNext: _nextPage,
            onSkip: _onSkip,
          ),
          Onboarding(
            image: 'assets/images/trusted_provider.png',
            mainText: "Book Trusted Provider",
            secondaryText: "View provider profiles, ratings, services, prices and availability",
            selectedIndex: _selectedIndex,
            onNext: _nextPage,
            onSkip: _onSkip,
          ),
          Onboarding(
            image: 'assets/images/job_done_onboarding.png',
            mainText: "Get the Job Done",
            secondaryText: "Book a time, track booking status, complete the service and leave a review.",
            selectedIndex: _selectedIndex,
            onNext: _nextPage,
            onSkip: _onSkip,
          ),
        ],
      ),
    );
  }
}
