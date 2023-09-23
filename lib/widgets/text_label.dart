import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handicrafts_flutter_app/utils/constants.dart';

class TextLabel extends StatelessWidget {
  final String icon;
  final String label;
  final double fontSize;
  final double iconH;
  final double iconW;

  const TextLabel({
    super.key,
    required this.icon,
    required this.label,
    this.fontSize = 13,
    this.iconH = 20,
    this.iconW = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
            height: iconH.h,
            width: iconW.w,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            label,
            style: TextStyle(fontSize: fontSize.sp, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
