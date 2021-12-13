import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/pages/sign_in_page.dart';

class SettingPage extends StatelessWidget {
  static const routeName = '/setting_page';
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.settings,
          color: Colors.purple,
          size: 30,
        ),
        title: Text(
          'Setting Page',
          style: titleTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: kWhiteColor,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(12),
            height: 250,
            width: 300,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout_rounded,
                  size: 35,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  'Oh no! You\'re leaving...\nAre you sure?',
                  textAlign: TextAlign.center,
                  style: titleTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignInPage.routeName);
                  },
                  child: Text('Logout'),
                  style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
