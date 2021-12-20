import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/models/user_model.dart';
import 'package:kost_z/pages/log_in_page.dart';

class SettingPage extends StatefulWidget {
  static const routeName = '/setting_page';

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel loggedInUser = UserModel();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("user")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget btnLogOut() {
      return ElevatedButton(
        onPressed: () async {
          await _auth.signOut();
          Navigator.pushReplacementNamed(context, LoginPage.routeName);
        },
        child: Text('Logout'),
        style: ElevatedButton.styleFrom(primary: kPrimaryColor),
      );
    }

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
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 30),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Image.asset('assets/boy.png'),
                ),
                SizedBox(
                  width: 14,
                ),
                Text(
                  '${loggedInUser.firstName} ${loggedInUser.secondName}',
                  style: titleTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
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
                btnLogOut()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
