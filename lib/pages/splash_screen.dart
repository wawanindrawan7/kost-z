import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/pages/get_started_page.dart';
import 'package:kost_z/pages/main_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, GetStartedPage.routeName, (route) => false);
      } else {
        print(user.email);
        Navigator.pushNamedAndRemoveUntil(
            context, MainPage.routeName, (route) => false);
      }
    });
    super.initState();
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
