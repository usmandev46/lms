import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;

  const MyText(
      this.text, {
        super.key,
        this.fontSize,
        this.fontWeight,
        this.color,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.letterSpacing,
        this.wordSpacing,
        this.height,
        this.decoration,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        height: height,
        decoration: decoration,
      ),
    );
  }
}
