import 'package:flutter/material.dart';
import 'package:handicrafts_flutter_app/screens/login_page.dart';
import 'package:handicrafts_flutter_app/screens/register_page.dart';
import 'package:handicrafts_flutter_app/utils/constants.dart';

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('assets/images/bg_screens.png', width: double.infinity,fit: BoxFit.cover),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  height: 65,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(40),
                  ),

                  child: TabBar(
                      controller: _tabController,
                      onTap: (int selectedTabIndex) {},
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(color: kPrimaryColor)),
                      tabs: [
                        Text(
                          'تسجيل الدخول',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        Text(
                          'تسجيل',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ]),
                ),
                Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [LoginPage(), RegisterPage()],
                ))
              ],
            ),
            ]
        ),
      ),
    );
  }
}
