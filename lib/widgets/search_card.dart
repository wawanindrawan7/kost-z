import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/models/kost_model.dart';
import 'package:kost_z/pages/detail_page.dart';

class SearchCard extends StatefulWidget {
  final Kosan kost;

  SearchCard({required this.kost});

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailPage.routeName,
          arguments: {"id": widget.kost.id, "kost": widget.kost},
        );
      },
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 10),
        height: 300,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "$imageBaseUrl${widget.kost.thumbnail}",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.kost.nama,
                        style: titleTextStyle.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                            size: 12,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.kost.lokasi,
                                style: titleTextStyle.copyWith(fontSize: 12),
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
                            widget.kost.rating.toString(),
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
          ],
        ),
      ),
    );
  }
}
