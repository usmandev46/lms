import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants/app_colors.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const MyTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: validator,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium?.color,
          fontSize: 15.sp,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
            fontSize: 15.sp,
          ),
          filled: true,
          fillColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white12
              : Colors.grey[200],
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        ),
      ),
    );
  }
}
