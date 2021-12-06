import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/models/kost_item.dart';
import 'package:kost_z/pages/detail_page.dart';

class KostItemCard extends StatelessWidget {
  final KostItem kost;

  KostItemCard({required this.kost});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(kost: kost),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                    image: AssetImage(kost.imageUrl), fit: BoxFit.cover),
              ),
            ),
            Container(
              height: 90,
              margin: EdgeInsets.only(top: 120),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent.withOpacity(1),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kost.name,
                    style: titleTextStyle.copyWith(
                        color: kWhiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.room,
                              size: 16,
                              color: Colors.purple,
                            ),
                            Text(
                              kost.location,
                              style: titleTextStyle.copyWith(
                                color: kWhiteColor,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              width: 53,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(18),
                  topLeft: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 22,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        kost.rating,
                        style: titleTextStyle.copyWith(
                            color: kBlackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
