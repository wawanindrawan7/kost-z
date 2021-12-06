import 'package:flutter/material.dart';

class FeaturesCard extends StatelessWidget {
  const FeaturesCard({Key? key}) : super(key: key);

  Widget buildListFeatures() {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 12),
          buildFeatures1(),
          buildFeatures2(),
          buildFeatures3(),
          SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget buildFeatures1() {
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'images/card1.png',
          ),
        ),
      ),
    );
  }

  Widget buildFeatures2() {
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'images/card2.png',
          ),
        ),
      ),
    );
  }

  Widget buildFeatures3() {
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'images/card3.png',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildListFeatures();
  }
}
