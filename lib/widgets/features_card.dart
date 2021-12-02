import 'package:flutter/material.dart';

class FeaturesCard extends StatelessWidget {
  const FeaturesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'images/bg_header.png',
          ),
        ),
      ),
    );
  }
}
