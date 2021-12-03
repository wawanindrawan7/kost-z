import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/models/kost_item.dart';
import 'package:kost_z/widgets/features_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home_page';

  Widget buildSearch(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.27),
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: kWhiteColor,
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
                hintText: "Search kost"),
          ),
        ),
      ],
    );
  }

  Widget buildTextHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.person_rounded,
                color: kWhiteColor,
                size: 22,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Hi, Iqbal!',
                style: titleTextStyle.copyWith(
                  fontSize: 14,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 26,
          ),
          Text(
            'Let\'s Explore the\nKost Together',
            textAlign: TextAlign.center,
            style: titleTextStyle.copyWith(
              fontSize: 30,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'images/bg_header.png',
            ),
          ),
        ),
        child: buildTextHeader());
  }

  Widget buildFeatures() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 24),
            child: Text(
              'Features',
              style: titleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 12),
                FeaturesCard(),
                FeaturesCard(),
                FeaturesCard(),
                SizedBox(width: 12),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildRecommended() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 24),
            child: Text(
              'Recommended',
              style: titleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: GridView.count(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              children: kostItemList.map((kost) {
                return Container(
                  height: 60,
                  child: Card(
                    child: Stack(
                      children: [
                        Expanded(
                          child: Image.asset(
                            kost.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(kost.name),
                            Text(kost.location),
                            Text(kost.fasilitas.kamarMandi!),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ), //widget Grid
          )
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: ListView(children: [
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(context),
                buildFeatures(),
                buildRecommended(),
              ],
            ),
            buildSearch(context),
          ],
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }
}
