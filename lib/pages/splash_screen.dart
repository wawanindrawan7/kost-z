import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/pages/get_started_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(
      duration,
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) {
              return GetStartedPage();
            },
          ),
        );
      },
    );
  }

  Widget buildContent() {
    return Container(
      height: 250,
      width: 250,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(
            'images/splash.png',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashColor,
      body: SafeArea(
        child: Center(
          child: buildContent(),
        ),
      ),
    );
  }
}
