import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handicrafts_flutter_app/utils/constants.dart';

class AppTextField extends StatelessWidget {
  final TextInputType textInputField;
  final bool obscureText;
  final IconData? suffixIcon;
  final String? hintText;
  final int maxLines;
  final double width;
  final double height;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool enabled;

  const AppTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.maxLines = 1,
    this.width = double.infinity,
    this.obscureText = false,
    this.textInputField = TextInputType.text,
    this.height = 60,
    required this.controller,
    this.validator,
    this.prefixIcon,
    this.enabled = true,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        keyboardType: textInputField,
        obscureText: obscureText,
        enabled: enabled,
        style: const TextStyle(fontSize: 13,color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.only(bottom: 15.0,left: 5,right: 5), // Apply padding at the bottom
          hintStyle: TextStyle(fontSize: 12.sp,color: Colors.grey),
          filled: true,
          fillColor: Colors.grey.shade50,
          suffixIcon: Icon(
            suffixIcon,
            color: kPrimaryColor,
          ),
          enabledBorder: getBorder(),
          disabledBorder: getBorder(),
          focusedBorder: getBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(10).r);
  }
}
