import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final int? maxLines;

  const LabelText(
      {super.key,
      required this.text,
      required this.size,
      this.color,
      this.fontStyle,
      this.fontWeight,
      this.decoration,
      this.textAlign,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? Colors.black,
          fontFamily: "SF-Pro-Display",
          fontSize: size.sp,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontWeight: fontWeight ?? FontWeight.normal,
          decoration: decoration ?? TextDecoration.none),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      softWrap: true,
    );
  }
}
