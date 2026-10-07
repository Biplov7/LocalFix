import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localfix/core/router/app_name.dart';
import 'package:localfix/core/theme/app_colors.dart';
import 'package:localfix/core/theme/app_spacing.dart';
import 'package:localfix/core/theme/app_text_styles.dart';

class Splash extends StatefulWidget {
  const new({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double _scale = 0.5;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!mounted) return;

      setState(() {
        _scale = 1.0;
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) {
        return;
      }
      context.goNamed(AppName.boardingName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.21),
          AnimatedScale(
            scale: _scale,
            duration: const Duration(seconds: 1),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.16,
              width: MediaQuery.of(context).size.height * 0.16,
              decoration: BoxDecoration(),
              child: Image.asset('assets/images/splash_logo.png'),
            ),
          ),
          SizedBox(height: AppSpacing.sm),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Local",
                  style: AppTextStyles.displayMassive.copyWith(
                    color: AppColors.darkCard,
                  ),
                ),
                TextSpan(
                  text: "Fix",
                  style: AppTextStyles.displayMassive.copyWith(
                    color: AppColors.info,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Find trusted local services",
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.darkTextDisabled,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.16,
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Image.asset('assets/images/splash_home.png'),
            ),
          ),
        ],
      ),
    );
  }
}
