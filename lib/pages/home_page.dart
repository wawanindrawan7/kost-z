import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColors,
    );
  }
}
