import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/models/kost_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';

  final KostItem kost;

  const DetailPage({
    Key? key,
    required this.kost,
  }) : super(key: key);

  Widget contentImage(BuildContext context, KostItem kost) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(kost.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: FadeInDown(
        duration: Duration(milliseconds: 500),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kost.name,
                  style: titleTextStyle.copyWith(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.room,
                      color: Colors.purple,
                      size: 20,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kost.location,
                          style: titleTextStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.all(6.0),
              height: 40,
              width: 66,
              decoration: BoxDecoration(
                color: kLightPrimaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.star_rounded,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: Text(
                      kost.rating,
                      style: titleTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(
            duration: Duration(milliseconds: 700),
            child: Text(
              "Description",
              style: titleTextStyle.copyWith(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeInDown(
            duration: Duration(milliseconds: 900),
            child: Text(
              kost.description,
              style: titleTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFacility() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(
            duration: Duration(milliseconds: 700),
            child: Text(
              "Facility",
              style: titleTextStyle.copyWith(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeInDown(
            duration: Duration(milliseconds: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: kost.facility.map((facility) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          child: Image.asset(
                            'images/item.png',
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(facility),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOtherImages() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(
            duration: Duration(milliseconds: 700),
            child: Text(
              "Other Images",
              style: titleTextStyle.copyWith(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeInDown(
            duration: Duration(milliseconds: 900),
            child: Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: kost.assetImages.map((photo) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(photo),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context, KostItem kost) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        Container(
          margin: EdgeInsets.only(top: 350, bottom: 50),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle(),
              SizedBox(
                height: 25,
              ),
              buildDescription(),
              SizedBox(
                height: 20,
              ),
              buildFacility(),
              SizedBox(
                height: 20,
              ),
              buildOtherImages(),
            ],
          ),
        ),
      ],
    );
  }

  Widget backButton(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 18, top: 25),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget mapButton() {
    return SafeArea(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 18, top: 25),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: IconButton(
              icon: Icon(
                Icons.room,
                color: kPrimaryColor,
              ),
              onPressed: () => launchUrl(kost.maps.toString()),
            ),
          ),
        ],
      ),
    );
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        throw "Could not launch $url";
      }
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => launchUrl('tel:${kost.noHp}'),
        icon: Icon(Icons.call),
        label: Text(
          'Contact',
          style: contentTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Stack(
        children: [
          contentImage(context, kost),
          buildBody(context, kost),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              backButton(context),
              mapButton(),
            ],
          ),
        ],
      ),
    );
  }
}
