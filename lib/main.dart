import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kost_z/helpers/navigation_helper.dart';
import 'package:kost_z/models/kost_item.dart';
import 'package:kost_z/pages/bookmark_page.dart';
import 'package:kost_z/pages/get_started_page.dart';
import 'package:kost_z/pages/home_page.dart';
import 'package:kost_z/pages/detail_page.dart';
import 'package:kost_z/pages/main_page.dart';
import 'package:kost_z/pages/search_page.dart';
import 'package:kost_z/pages/setting_page.dart';
import 'package:kost_z/pages/sign_in_page.dart';
import 'package:kost_z/pages/sign_up_page.dart';
import 'package:kost_z/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kost-Z',
      navigatorKey: navigatorKey,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        GetStartedPage.routeName: (context) => GetStartedPage(),
        SignInPage.routeName: (context) => SignInPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
        MainPage.routeName: (context) => MainPage(),
        HomePage.routeName: (context) => HomePage(),
        DetailPage.routeName: (context) => DetailPage(
            kost: ModalRoute.of(context)!.settings.arguments as KostItem),
        SearchPage.routeName: (context) => SearchPage(),
        BookmarkPage.routeName: (context) => BookmarkPage(),
        SettingPage.routeName: (context) => SettingPage(),
      },
    );
  }
}
