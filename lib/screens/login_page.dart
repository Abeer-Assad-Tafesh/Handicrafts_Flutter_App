import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:handicrafts_flutter_app/utils/constants.dart';
import 'package:handicrafts_flutter_app/widgets/app_button.dart';
import 'package:handicrafts_flutter_app/widgets/app_text_field.dart';
import 'package:handicrafts_flutter_app/widgets/big_text.dart';
import 'package:handicrafts_flutter_app/widgets/small_text.dart';
import 'package:handicrafts_flutter_app/widgets/text_label.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _forgetEmailController;
  late TextEditingController _passwordController;
  late String _forgetEmail;
  bool _obscurePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _forgetEmailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _forgetEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/bg_screens.png',
                width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: AlignmentDirectional.center,
                      child: SvgPicture.asset('assets/images/login.svg')),
                  BigText(
                    text: 'مرحبًا بعودتك',
                    size: 24.sp,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 4.h),
                  BigText(
                      text: 'شاهد آخر إبداع الحرفيين',
                      size: 16.sp,
                      color: Colors.grey),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const TextLabel(
                          icon: "assets/icons/email.svg",
                          label: 'البريد الإلكتروني',
                        ),
                        AppTextField(
                          controller: _emailController,
                          textInputField: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 12),
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
                        const SizedBox(height: 20),
                        AppButton(
                          onPressed: () {
                            login();
                          },
                          text: 'تسجيل الدخول',
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          child: SmallText(
                            text: 'هل نسيت كلمة المرور ؟',
                            size: 14,
                            color: kPrimaryColor,
                            decoration: TextDecoration.underline,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    scrollable: true,
                                    insetPadding: const EdgeInsets.all(10),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        margin: const EdgeInsets.all(10.0),
                                        width: 400.w,
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                BigText(
                                                  text: 'نسيت كلمة المرور',
                                                  size: 18,
                                                  color: kPrimaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                const SmallText(
                                                    text:
                                                        'سيتم إرسال رمز التحقق',
                                                    size: 13,
                                                    color: Colors.black),
                                                const SizedBox(height: 15),
                                                const TextLabel(
                                                  icon:
                                                      "assets/icons/email.svg",
                                                  label: 'الإيميل',
                                                ),
                                                AppTextField(
                                                  controller:
                                                      _forgetEmailController,
                                                ),
                                                const SizedBox(height: 30),
                                                AppButton(
                                                  onPressed: () async {
                                                    if (_forgetEmail
                                                        .isNotEmpty) {
                                                      await forgetPassword(
                                                          context);
                                                    }
                                                  },
                                                  text: 'تحقق الآن',
                                                  height: 48,
                                                  width: 250,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
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

  Future<void> forgetPassword(BuildContext cont) async {}

  Future<void> login() async {
    if (checkData()) {}
  }

  final RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  bool checkData() {
    if (_emailController.text.isEmpty) {
      Get.snackbar('مهلاً', 'أدخل ايميلك ', colorText: Colors.red);
      return false;
    } else if (!regex.hasMatch(_emailController.text)) {
      Get.snackbar('مهلاً', 'أدخل إيميل صحيح ', colorText: Colors.red);
      return false;
    } else if (_passwordController.text.isEmpty) {
      Get.snackbar('مهلاً', 'أدخل كلمة المرور ', colorText: Colors.red);
      return false;
    }
    return true;
  }
}
