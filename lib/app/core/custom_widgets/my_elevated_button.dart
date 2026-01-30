import 'package:flutter/material.dart';
import '../extensions/size_extensions.dart';
import 'my_text.dart';

class MyElevatedButton extends StatelessWidget {
  final String text;
  final Widget? icons;
  final VoidCallback onPressed;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final double? height;

  const MyElevatedButton({
    super.key,
    required this.text,
    this.icons,
    required this.onPressed,
    this.fontSize,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 7.h,
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: icons,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
        ),
         label: MyText(
          text,
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 1.6.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
