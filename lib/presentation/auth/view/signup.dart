import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:localfix/core/router/app_name.dart';
import 'package:localfix/core/theme/app_colors.dart';
import 'package:localfix/core/theme/app_spacing.dart';
import 'package:localfix/core/theme/app_text_styles.dart';
import 'package:localfix/domain/Auth/entities/signup_entity.dart';
import 'package:localfix/presentation/auth/bloc/auth_bloc.dart';
import 'package:localfix/presentation/auth/bloc/auth_event.dart';
import 'package:localfix/presentation/auth/bloc/auth_state.dart';
import 'package:localfix/presentation/auth/widget/my_button.dart';
import 'package:localfix/presentation/auth/widget/textformsection.dart';

class Signup extends StatefulWidget {
  const new({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
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
                    SizedBox(height: AppSpacing.md),
                    Text(
                      "Create your account",
                      style: AppTextStyles.headingLarge.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "Join LocalFix and get access to trusted local services.",
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.black.withValues(alpha: 0.6),
                      ),
                    ),
                    SizedBox(height: AppSpacing.lg),
                    Text("Full Name", style: AppTextStyles.titleSmall),
                    SizedBox(height: AppSpacing.lg),
                    Textformsection(
                      controller: nameController,
                      labelText: "John Doe",
                      obscureText: false,
                      validator: (value) {
                        final nameRegex = RegExp(r'^[a-zA-Z ]+$');
                        if (value == null || value.trim().isEmpty) {
                          return "Name is required";
                        }
                        if (!nameRegex.hasMatch(value)) {
                          return 'Name can only contain letters';
                        }
                        return null;
                      },
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
                    Text("Phone Number", style: AppTextStyles.titleSmall),
                    SizedBox(height: AppSpacing.lg),
                    Textformsection(
                      controller: phoneController,
                      labelText: "9843443313",
                      obscureText: false,
                      validator: (value) {
                        final phoneRegex = RegExp(r'^[0-9]+$');
                        if (value == null || value.trim().isEmpty) {
                          return "Phone number is required";
                        }
                        if (!phoneRegex.hasMatch(value)) {
                          return 'Phone number can only contains numbers';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.lg),
                    Text("Password", style: AppTextStyles.titleSmall),
                    SizedBox(height: AppSpacing.lg),
                    Textformsection(
                      controller: passwordController,
                      labelText: "Create your password",
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
                    Text("Confirm Password", style: AppTextStyles.titleSmall),
                    SizedBox(height: AppSpacing.lg),
                    Textformsection(
                      controller: confirmPasswordController,
                      labelText: "Confirm you password",
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        }
                        if (passwordController.text != value) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.lg),
                    state is AuthLoading
                        ? const Center(child: CircularProgressIndicator())
                        : MyButton(
                            buttonText: "Sign Up",
                            backgroundColor: AppColors.darkInfo,
                            textColor: AppColors.darkTextPrimary,
                            onPressed: () {
                              if (_globalKey.currentState!.validate()) {
                                final user = SignupEntity(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                );
                                context.read<AuthBloc>().add(
                                  SignupAuthSubmitted(user),
                                );
                              }
                            },
                          ),
                    SizedBox(height: AppSpacing.xl),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "By signing up, you agree to our ",
                          style: AppTextStyles.bodySmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(AppName.signupName);
                          },
                          child: Text(
                            "Terms & Conditions",
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.darkInfo,
                              fontWeight: FontWeight.w900,
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
}
