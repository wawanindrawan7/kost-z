import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:kost_z/common/styles.dart';
import 'package:kost_z/models/kost_model.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail_page';

  final int id;
  final Kosan kost;

  const DetailPage({
    Key? key,
    required this.id,
    required this.kost,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Widget contentImage(BuildContext context, Kosan kost) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("$imageBaseUrl${kost.thumbnail}"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildTitle(Kosan kost) {
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
                  kost.nama,
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
                          kost.lokasi,
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
                      kost.rating.toString(),
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

  Widget buildDescription(Kosan kost) {
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
              kost.deskripsi,
              style: titleTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFacility(Kosan kost) {
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
              children: kost.fasilitas
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.explore_rounded,
                            color: kPrimaryColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            item.nama,
                            style: titleTextStyle,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOtherImages(Kosan kost) {
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
                children: kost.photo
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "$imageBaseUrl${item.url}",
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context, Kosan kost) {
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
              buildTitle(kost),
              SizedBox(
                height: 25,
              ),
              buildDescription(kost),
              SizedBox(
                height: 20,
              ),
              buildFacility(kost),
              SizedBox(
                height: 20,
              ),
              buildOtherImages(kost),
              SizedBox(
                height: 20,
              ),
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

  Widget mapButton(Kosan kost) {
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
    return Scaffold(
      backgroundColor: kWhiteColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => launchUrl('tel:${widget.kost.noHp}'),
        icon: Icon(Icons.call),
        label: Text(
          'Contact',
          style: contentTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Stack(
        children: [
          contentImage(context, widget.kost),
          buildBody(context, widget.kost),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              backButton(context),
              mapButton(widget.kost),
            ],
          ),
        ],
      ),
    );
  }
}
