import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handicrafts_flutter_app/utils/constants.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class IntelPhoneTextField extends StatelessWidget {
  final TextInputType textInputField;
  final bool obscureText;
  final IconData? suffixIcon;
  final String? hintText;
  final int maxLines;
  final double width;
  final double height;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final bool enabled;

  const IntelPhoneTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.maxLines = 1,
    this.width = double.infinity,
    this.obscureText = false,
    this.textInputField = TextInputType.text,
    this.height = 80,
    required this.controller,
    this.prefixIcon,
    this.enabled = true,

  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: height.h,
        width: width.w,
        child: IntlPhoneField(
          controller: controller,
          keyboardType: textInputField,
          obscureText: obscureText,
          enabled: enabled,
          autovalidateMode: AutovalidateMode.disabled,
          flagsButtonMargin: const EdgeInsets.only(right: 20),
          style: const TextStyle(fontSize: 13,color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            contentPadding: const EdgeInsets.only(bottom: 15.0,left: 45,right: 25),
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
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          pickerDialogStyle: PickerDialogStyle(
            countryNameStyle: const TextStyle(fontSize: 13,color: Colors.black),
            countryCodeStyle: TextStyle(fontSize: 13,
                color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
            searchFieldInputDecoration: const InputDecoration(
              icon: Icon(Icons.search),
              labelText: 'ابحث عن الدولة'
            )
          ),
          dropdownIcon: const Icon(Icons.arrow_drop_down,size: 20, color: Colors.black,),
          showCountryFlag: false,
          initialCountryCode: 'PS',
          languageCode: 'ar',
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
