import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/pages/log_in_page.dart';

class GetStartedPage extends StatelessWidget {
  static const routeName = '/get_started_page';
  const GetStartedPage({Key? key}) : super(key: key);

  Widget backContent() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 90),
        child: Column(
          children: [
            Text(
              'Hi, People!',
              textAlign: TextAlign.center,
              style: contentTextStyle.copyWith(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    'images/logo_app.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'images/logo_app.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'KOST-Z',
                        style: titleTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        'Explore Cozy Kost On Your Hand',
                        style: titleTextStyle.copyWith(fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Explore Cozy Kost at Lombok with us and let yourself get an amazing Comfortable Place.',
                style: titleTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        LoginPage.routeName,
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'Get Started',
                          style: contentTextStyle.copyWith(fontSize: 16),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_rounded),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      primary: kPrimaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 19, vertical: 13),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashColor,
      body: SafeArea(
        child: Stack(
          children: [
            backContent(),
            cardContent(context),
          ],
        ),
      ),
    );
  }
}
