import 'package:abook/shared/themes/colors.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class AudioTextField extends StatelessWidget {
  const AudioTextField({
    super.key,
    required this.hintText,
    required this.obsrcure,
    required this.keyboardType,
    this.controller,
    this.validator,
  });

  final String hintText;
  final bool obsrcure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obsrcure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
            ? AppColors.faintDark
            : const Color(0xFFF5F5FA),
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
              ? AppColors.audioGrey
              : Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
