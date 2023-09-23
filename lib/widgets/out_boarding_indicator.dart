import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handicrafts_flutter_app/utils/constants.dart';

class OutBoardingIndicator extends StatelessWidget {
  final double width;
  final double height;
  final double marginEnd;
  final bool selected;
  final Color unSelectedColor;

  const OutBoardingIndicator({super.key,
    required this.selected,
    required this.marginEnd,
    this.width = 8,
    this.height= 8,
    this.unSelectedColor = Colors.black26,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: selected ? kPrimaryColor : unSelectedColor,
        borderRadius: BorderRadius.circular(10).r,
      ),
      margin: EdgeInsetsDirectional.only(end: marginEnd.w),
    );
  }
}
