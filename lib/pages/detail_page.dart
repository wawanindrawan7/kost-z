import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:kost_z/common/styles.dart';
import 'package:kost_z/models/kost_item.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';
  const DetailPage({
    Key? key,
    required this.kost,
  }) : super(key: key);

  final KostItem kost;

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

  Widget contentBody(BuildContext context, KostItem kost) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        Container(
          margin: EdgeInsets.only(top: 350, bottom: 20),
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
              Container(
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
                                size: 28,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    kost.location,
                                    style:
                                        titleTextStyle.copyWith(fontSize: 11),
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
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
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
                      child: Text(kost.deskripsi),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            contentImage(context, kost),
            contentBody(context, kost),
            backButton(context),
          ],
        ),
      ),
    );
  }
}
