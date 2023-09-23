import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:handicrafts_flutter_app/utils/constants.dart';
import 'package:handicrafts_flutter_app/widgets/app_button.dart';
import 'package:handicrafts_flutter_app/widgets/app_text_field.dart';
import 'package:handicrafts_flutter_app/widgets/big_text.dart';
import 'package:handicrafts_flutter_app/widgets/intl_phone_text_field.dart';
import 'package:handicrafts_flutter_app/widgets/small_text.dart';
import 'package:handicrafts_flutter_app/widgets/text_label.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumController;
  late TextEditingController _passwordController;
  bool _obscurePassword = true;
  bool? isChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg_screens.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: AlignmentDirectional.center,
                      child: SvgPicture.asset('assets/images/register.svg')),
                  const BigText(
                    text: 'مرحبًا بك في عالم Handcrafts',
                    size: 18,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextLabel(
                          icon: "assets/icons/profile.svg",
                          label: 'الاسم بالكامل',
                        ),
                        AppTextField(
                          controller: _fullNameController,
                        ),
                        SizedBox(height: 8.h),
                        const TextLabel(
                          icon: "assets/icons/email.svg",
                          label: 'البريد الإلكتروني',
                        ),
                        AppTextField(
                          controller: _emailController,
                          textInputField: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 8.h),
                        const TextLabel(
                          icon: "assets/icons/call.svg",
                          label: 'رقم الجوال',
                        ),
                        Align(
                          child: IntelPhoneTextField(
                            controller: _phoneNumController,
                            hintText: '059/056',
                            textInputField: TextInputType.phone,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        const TextLabel(
                          icon: "assets/icons/password.svg",
                          label: 'كلمة المرور',
                        ),
                        Stack(
                          children: [
                            AppTextField(
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                            ),
                            Positioned(
                              left: 5,
                              top: 3,
                              child: IconButton(
                                icon: _obscurePassword
                                    ? SvgPicture.asset(
                                        'assets/icons/show.svg',
                                        colorFilter: ColorFilter.mode(
                                            kPrimaryColor, BlendMode.srcIn),
                                      )
                                    : SvgPicture.asset(
                                        'assets/icons/hide.svg',
                                        colorFilter: ColorFilter.mode(
                                            kPrimaryColor, BlendMode.srcIn),
                                      ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Container(
                              width: 20.w,
                              height: 20.h,
                              margin: const EdgeInsets.only(left: 10).w,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,width: 2), // Red border
                                borderRadius: BorderRadius.circular(0.0).r, // Rounded corners
                              ),
                              child: Checkbox(
                                value: isChecked,
                                activeColor: Colors.white54,
                                checkColor: kPrimaryColor,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    isChecked = newValue;
                                  });
                                },
                              ),
                            ),
                            SmallText(
                              text: 'أوافق على الشروط والأحكام',
                              color: kPrimaryColor,
                              size: 12.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Align(
                          alignment: Alignment.center,
                          child: AppButton(
                            text: 'تسجيل',
                            onPressed: () async {
                              await register();
                            },
                          ),
                        ),
                        SizedBox(height: 100.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> register() async {
    if (checkData()) {}
  }

  final RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final RegExp regExp = RegExp(r'(^(?:5[96])?[0-9]{7}$)');

  bool checkData() {
    if (_fullNameController.text.isEmpty) {
      Get.snackbar('مهلاً', 'أدخل اسمك ', colorText: Colors.red);
      return false;
    } else if (_fullNameController.text.length < 3) {
      Get.snackbar('مهلاً', 'أدخل اسم لا يقل عن 3 حروف ',
          colorText: Colors.red);
      return false;
    } else if (_emailController.text.isEmpty) {
      Get.snackbar('مهلاً', 'أدخل إيميل ', colorText: Colors.red);
      return false;
    } else if (!regex.hasMatch(_emailController.text)) {
      Get.snackbar('مهلاً', 'أدخل إيميل صحيح ', colorText: Colors.red);
      return false;
    } else if (_phoneNumController.text.isEmpty) {
      Get.snackbar('مهلاً', 'أدخل رقم هاتفك ', colorText: Colors.red);
      return false;
    } else if (!regExp.hasMatch(_phoneNumController.text)) {
      Get.snackbar('مهلاً', 'أدخل رقم هاتف صحيح', colorText: Colors.red);
      return false;
    } else if (_passwordController.text.isEmpty) {
      Get.snackbar('مهلاً', 'أدخل كلمة مرور', colorText: Colors.red);
      return false;
    } else if (_passwordController.text.length < 6) {
      Get.snackbar('مهلاً', 'أدخل كلمة مرور لا تقل عن 6 خانات',
          colorText: Colors.red);
      return false;
    }
    return true;
  }
}
