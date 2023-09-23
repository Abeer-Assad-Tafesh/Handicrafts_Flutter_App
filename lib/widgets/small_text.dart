import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;
  final TextOverflow overflow;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration decoration ;
  final int maxLines;

  const SmallText({
    Key? key,
    this.color = Colors.black,
    required this.text,
    this.size = 11,
    this.height = 1.2,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.decoration = TextDecoration.none,
    this.maxLines = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: size.sp,
        fontWeight: fontWeight,
        decoration: decoration,
        height: height.h,
      ),
    );
  }
}
