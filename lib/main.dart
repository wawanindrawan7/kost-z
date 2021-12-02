import 'package:flutter/material.dart';
import 'package:kost_z/pages/home_page.dart';
import 'package:kost_z/started/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kost-Z',
      initialRoute: HomePage.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
