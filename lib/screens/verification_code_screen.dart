import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:handicrafts_flutter_app/screens/reset_forgot_password.dart';
import 'package:handicrafts_flutter_app/utils/constants.dart';
import 'package:handicrafts_flutter_app/widgets/app_button.dart';
import 'package:handicrafts_flutter_app/widgets/big_text.dart';
import 'package:handicrafts_flutter_app/widgets/code_box.dart';
import 'package:handicrafts_flutter_app/widgets/small_text.dart';

class VerificationCodeScreen extends StatefulWidget {
  final String? email;
  final String? emailCode;
  const VerificationCodeScreen({Key? key, this.email,this.emailCode}) : super(key: key);

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  late TextEditingController _firstTextController;
  late TextEditingController _secondTextController;
  late TextEditingController _thirdTextController;
  late TextEditingController _forthTextController;
  late FocusNode _firstNode;
  late FocusNode _secondNode;
  late FocusNode _thirdNode;
  late FocusNode _forthNode;

  String? _code;

  Timer? _timer;
  int _secondsRemaining = 80;
  bool _timerFinished = false;

  @override
  void initState() {
    startTimer();
    super.initState();
    _firstTextController = TextEditingController();
    _secondTextController = TextEditingController();
    _thirdTextController = TextEditingController();
    _forthTextController = TextEditingController();
    _firstNode = FocusNode();
    _secondNode = FocusNode();
    _thirdNode = FocusNode();
    _forthNode = FocusNode();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _firstTextController.dispose();
    _secondTextController.dispose();
    _thirdTextController.dispose();
    _forthTextController.dispose();
    _firstNode.dispose();
    _secondNode.dispose();
    _thirdNode.dispose();
    _forthNode.dispose();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_secondsRemaining <= 0) {
        timer.cancel();
        setState(() {
          _timerFinished = true;
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void resendCode() {
    setState(() {
      _secondsRemaining = 80;
      _timerFinished = false;
    });
    startTimer();
    // Perform the code for resending the verification code
    forgetPassword();
  }

  String formatTimer() {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/bg_screens.png'),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
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
                      Text('رمز التحقق'),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/images/verif_code.svg'),
                        BigText(
                            text: 'أدخل رمز التحقق',
                            size: 22,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                        const Text(
                          'تم إرسال رمز التحقق',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SmallText(
                          text: '${widget.email}',
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CodeBox(
                              textEditingController: _firstTextController,
                              focusNode: _firstNode,
                              onChanged: (value) {
                                if(value.isNotEmpty){
                                  _secondNode.requestFocus();
                                }
                              },
                            ),
                            CodeBox(
                              textEditingController: _secondTextController,
                              focusNode: _secondNode,
                              onChanged: (value) {
                                if(value.isNotEmpty){
                                  _thirdNode.requestFocus();
                                }else{
                                  _firstNode.requestFocus();
                                }
                              },
                            ),
                            CodeBox(
                              textEditingController: _thirdTextController,
                              focusNode: _thirdNode,
                              onChanged: (value) {
                                if(value.isNotEmpty){
                                  _forthNode.requestFocus();
                                }else{
                                  _secondNode.requestFocus();
                                }
                              },
                            ),
                            CodeBox(
                              textEditingController: _forthTextController,
                              focusNode: _forthNode,
                              onChanged: (value) {
                                if(value.isNotEmpty){
                                  _thirdNode.requestFocus();
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        AppButton(
                          onPressed: () {
                            checkCode();
                          },
                          text: 'تحقق الآن',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        !_timerFinished
                            ? BigText(
                            text: 'إعادة إرسال بعد',
                            size: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold)
                            : TextButton(
                          onPressed: () {
                            resendCode();
                          },
                          child: BigText(
                            text: 'أعد إرسال الكود',
                            size: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SmallText(
                          text: formatTimer(),
                          size: 12,
                          color: Colors.grey,
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

  checkCode() {
    _code = _firstTextController.text +
        _secondTextController.text +
        _thirdTextController.text +
        _forthTextController.text;
    if (_firstTextController.text.isNotEmpty &&
        _secondTextController.text.isNotEmpty &&
        _thirdTextController.text.isNotEmpty &&
        _forthTextController.text.isNotEmpty) {
      if (_code == widget.emailCode) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
            ResetPasswordScreen(code: _code,email: widget.emailCode,)));
      } else {
        // Get.snackbar('خطأ في كود التحقق!', 'أدخل كود التحقق الصحيح', colorText: Colors.red);
      }
    }else {
      // Get.snackbar('خطأ!', 'أدخل كود التحقق أولاً', colorText: Colors.red);
    }
  }

  Future<void> forgetPassword() async {
  }
}
