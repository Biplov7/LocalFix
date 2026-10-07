import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:localfix/core/router/app_name.dart';
import 'package:localfix/core/theme/app_colors.dart';
import 'package:localfix/core/theme/app_spacing.dart';
import 'package:localfix/core/theme/app_text_styles.dart';
import 'package:localfix/domain/Auth/entities/login_entity.dart';
import 'package:localfix/presentation/auth/bloc/auth_bloc.dart';
import 'package:localfix/presentation/auth/bloc/auth_event.dart';
import 'package:localfix/presentation/auth/bloc/auth_state.dart';
import 'package:localfix/presentation/auth/widget/my_button.dart';
import 'package:localfix/presentation/auth/widget/textformsection.dart';

class Login extends StatefulWidget {
  const new({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticate) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("User login successfully"),
                behavior: SnackBarBehavior.floating,
                backgroundColor: AppColors.success,
              ),
            );
            context.goNamed(AppName.dashboardName);
          }
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                behavior: SnackBarBehavior.floating,
                backgroundColor: AppColors.error,
              ),
            );
          }
          if (state is AuthUnAuthenticate) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Authenticate yourself first"),
                behavior: SnackBarBehavior.floating,
                backgroundColor: AppColors.error,
              ),
            );
            context.goNamed(AppName.loginName);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Form(
                key: _globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          loginLogo(context),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Local",
                                  style: AppTextStyles.displayLarge.copyWith(
                                    color: AppColors.darkCard,
                                  ),
                                ),
                                TextSpan(
                                  text: "Fix",
                                  style: AppTextStyles.displayLarge.copyWith(
                                    color: AppColors.info,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSpacing.md),
                    Text(
                      "Welcome Back",
                      style: AppTextStyles.headingLarge.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "Sign in to your account",
                      style: AppTextStyles.bodyLarge,
                    ),
                    SizedBox(height: AppSpacing.lg),
                    Text("Email", style: AppTextStyles.titleSmall),
                    SizedBox(height: AppSpacing.lg),
                    Textformsection(
                      controller: emailController,
                      labelText: "yourname@example.com",
                      obscureText: false,
                      validator: (value) {
                        final emailRegex = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        if (value == null || value.trim().isEmpty) {
                          return "Email is required";
                        }
                        if (!emailRegex.hasMatch(value.trim())) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.lg),
                    Text("Password", style: AppTextStyles.titleSmall),
                    SizedBox(height: AppSpacing.lg),
                    Textformsection(
                      controller: passwordController,
                      labelText: "Enter you password",
                      obscureText: true,
                      validator: (value) {
                        final passwordRegex = RegExp(
                          r'^(?=.*[!@#$%^&*(),.?":{}|<>]).+$',
                        );
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }

                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }

                        if (!passwordRegex.hasMatch(value)) {
                          return 'Password must contain a special character';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.lg),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // Implement forget password
                        },
                        child: Text(
                          "Forget password?",
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.darkInfo,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSpacing.lg),
                    state is AuthLoading
                        ? const Center(child: CircularProgressIndicator())
                        : MyButton(
                            buttonText: "Login",
                            backgroundColor: AppColors.darkInfo,
                            textColor: AppColors.darkTextPrimary,
                            onPressed: () {
                              if (_globalKey.currentState!.validate()) {
                                final user = LoginEntity(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                context.read<AuthBloc>().add(
                                  LoginAuthSubmitted(user),
                                );
                              }
                            },
                          ),
                    SizedBox(height: AppSpacing.lg),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.black.withValues(alpha: 0.4),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text('Or'),
                        ),

                        Expanded(
                          child: Divider(
                            color: AppColors.black.withValues(alpha: 0.4),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.lg),
                    MyButton(
                      buttonText: "Continue with google",
                      backgroundColor: AppColors.darkTextPrimary,
                      textColor: AppColors.black,
                      image: Image.asset(
                        'assets/images/google.webp',
                        height: 20,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(height: AppSpacing.massive),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: AppTextStyles.titleSmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(AppName.signupName);
                          },
                          child: Text(
                            " Sign up",
                            style: AppTextStyles.titleSmall.copyWith(
                              color: AppColors.darkInfo,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container loginLogo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(),
      child: Image.asset('assets/images/splash_logo.png'),
    );
  }
}
