import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:handicrafts_flutter_app/widgets/app_button.dart';
import 'package:handicrafts_flutter_app/widgets/app_text_field.dart';
import 'package:handicrafts_flutter_app/widgets/text_label.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String? code;
  final String? email;
  const ResetPasswordScreen({Key? key,this.code,this.email}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmedNewPasswordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newPasswordController = TextEditingController();
    _confirmedNewPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _newPasswordController.dispose();
    _confirmedNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(children: [
          Image.asset('assets/images/bg_screens.png'),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Icon(Icons.arrow_back),
                    SizedBox(
                      width: 8,
                    ),
                    Text('إعادة تعيين كلمة المرور'),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    alignment: AlignmentDirectional.center,
                    child:
                    SvgPicture.asset('assets/images/reset_password.svg')),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const TextLabel(
                            icon: "assets/icons/password.svg",
                            label: 'كلمة المرور'),
                        AppTextField(
                          controller: _newPasswordController,
                          suffixIcon: Icons.remove_red_eye_outlined,
                          obscureText: true,
                        ),
                        const SizedBox(height: 12),
                        const TextLabel(
                            icon: "assets/icons/password.svg",
                            label: 'تأكيد كلمة المرور',
                        ),
                        AppTextField(
                          controller: _confirmedNewPasswordController,
                          suffixIcon: Icons.remove_red_eye_outlined,
                          obscureText: true,
                        ),
                        const SizedBox(height: 40),
                        AppButton(
                          onPressed: () {
                            performResetPassword();
                          },
                          text: 'حفظ',
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  performResetPassword() async {
/*
    if (checkData()) {}
*/
  }
/*
  bool checkData() {
    if (_newPasswordController.text.isEmpty
        || _confirmedNewPasswordController.text.isEmpty) {
      Get.snackbar('مهلاً', 'أدخل كلمة المرور', colorText: Colors.red);
      return false;
    } else if (_newPasswordController.text.length < 6
        || _confirmedNewPasswordController.text.length < 6) {
      Get.snackbar('مهلاً', 'أدخل كلمة المرور ', colorText: Colors.red);
      return false;
    }
    return true;
  }
*/
}
