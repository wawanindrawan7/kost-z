import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:kost_z/models/kost_model.dart';
import 'package:kost_z/pages/bookmark_page.dart';
import 'package:kost_z/pages/explore_page.dart';
import 'package:kost_z/pages/home_page.dart';
import 'package:kost_z/pages/detail_page.dart';
import 'package:kost_z/pages/main_page.dart';
import 'package:kost_z/pages/setting_page.dart';
import 'package:kost_z/pages/log_in_page.dart';
import 'package:kost_z/pages/registration_page.dart';
import 'package:kost_z/pages/splash_screen.dart';
import 'package:kost_z/providers/kost_notifier.dart';
import 'package:kost_z/services/api_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => KostNotifier(
            apiService: ApiService(Client()),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kost-Z',
        home: SplashScreen(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case SplashScreen.routeName:
              return CupertinoPageRoute(
                builder: (_) => SplashScreen(),
              );
            case MainPage.routeName:
              return CupertinoPageRoute(
                builder: (_) => MainPage(),
              );
            case LoginPage.routeName:
              return CupertinoPageRoute(
                builder: (_) => LoginPage(),
              );
            case RegistrationPage.routeName:
              return CupertinoPageRoute(
                builder: (_) => RegistrationPage(),
              );
            case HomePage.routeName:
              return CupertinoPageRoute(
                builder: (_) => HomePage(),
              );
            case DetailPage.routeName:
              Map data = settings.arguments as Map;
              final int? id = data["id"];
              final Kosan? kost = data["kost"];
              return CupertinoPageRoute(
                builder: (_) => DetailPage(id: id!, kost: kost!),
              );
            case ExplorePage.routeName:
              return CupertinoPageRoute(
                builder: (_) => ExplorePage(),
              );
            case BookmarkPage.routeName:
              return CupertinoPageRoute(
                builder: (_) => BookmarkPage(),
              );
            case SettingPage.routeName:
              return CupertinoPageRoute(
                builder: (_) => SettingPage(),
              );

            default:
          }
        },
      ),
    );
  }
}
