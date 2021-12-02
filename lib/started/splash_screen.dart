import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/started/get_started.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splashscreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 6);
    return Timer(duration, () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => GetStartedPage(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 112),
              child: Image.asset(
                'images/logo.png',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'KOST-Z',
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'SOLUSI ANDA MENCARI KOSAN',
                  style: contentTextStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
