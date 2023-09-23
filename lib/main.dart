import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handicrafts_flutter_app/screens/launch_screen.dart';
import 'package:handicrafts_flutter_app/screens/login_page.dart';
import 'package:handicrafts_flutter_app/screens/login_register_screen.dart';
import 'package:handicrafts_flutter_app/screens/out_boarding_screen.dart';
import 'package:handicrafts_flutter_app/screens/register_page.dart';
import 'package:handicrafts_flutter_app/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 866),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'PNU',
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'PNU'),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: kPrimaryColor,
            cursorColor: kPrimaryColor,
            selectionHandleColor: kPrimaryColor,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
            ),
          ),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        initialRoute:  '/launch_screen',
        routes: routes,
      ),
    );
  }

  Map<String, Widget Function(BuildContext)> get routes{
    return {
      '/launch_screen' : (context) => const LaunchScreen(),
      '/out_boarding_screen': (context) => const OutBoardingScreen(),
      '/login_register_screen': (context) => const LoginRegisterScreen(),
      '/login_page': (context) => const LoginPage(),
      '/register_page': (context) => const RegisterPage(),
    };
  }

}

