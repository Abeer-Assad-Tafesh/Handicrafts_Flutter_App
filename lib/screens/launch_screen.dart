import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      Navigator.pushReplacementNamed(context, '/out_boarding_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/bg_screens.png' ,width: double.infinity,fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.only(left: 20.0.w),
            child: Center(
              child: SizedBox(
                height: 100.h,
                width: 100.w,
                child: SvgPicture.asset('assets/images/logo_image.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
