import 'package:flutter/material.dart';
import 'package:localfix/core/theme/app_colors.dart';
import 'package:localfix/core/theme/app_radius.dart';

class Textformsection extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;

  const new({
    super.key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
    required this.validator,
  });

  @override
  State<Textformsection> createState() => _TextformsectionState();
}

class _TextformsectionState extends State<Textformsection> {
  bool iconPress = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: iconPress,
      controller: widget.controller,
      decoration: InputDecoration(
        fillColor: AppColors.darkTextPrimary,
        contentPadding: EdgeInsets.all(12),
        hintText: widget.labelText,
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    iconPress = !iconPress;
                  });
                },
                icon: iconPress
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: AppColors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: AppColors.black),
        ),
      ),
      validator: widget.validator,
    );
  }
}
