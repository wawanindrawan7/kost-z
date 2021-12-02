import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/pages/home_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3040D2),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 99),
              child: Image.asset(
                'images/logo.png',
              ),
            ),
            SizedBox(
              height: 33,
            ),
            Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Jadikan rumahmu sebagai tempat yang paling nyaman untuk bersinggah, buruan pilih tempat singgah yang paling nyaman menurutmu.',
                    style: contentTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 53,
                ),
                ElevatedButton(
                  child: Text('Get Started'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      HomePage.routeName,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: kButtonColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 19, vertical: 13),
                      textStyle: titleTextStyle),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
