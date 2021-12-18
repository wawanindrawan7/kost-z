import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/models/kost_model.dart';
import 'package:kost_z/pages/detail_page.dart';
import 'package:kost_z/providers/bookmark_notifier.dart';
import 'package:provider/provider.dart';

class KostItemCard extends StatefulWidget {
  final Kosan kost;

  KostItemCard({required this.kost});

  @override
  State<KostItemCard> createState() => _KostItemCardState();
}

class _KostItemCardState extends State<KostItemCard> {
  @override
  Widget build(BuildContext context) {
    BookmarkNotifier bookmarkNotifier = Provider.of<BookmarkNotifier>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailPage.routeName,
          arguments: {"id": widget.kost.id, "kost": widget.kost},
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            Container(
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                    image: NetworkImage(
                      "$imageBaseUrl${widget.kost.thumbnail}",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              height: 90,
              margin: EdgeInsets.only(top: 135),
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
                    widget.kost.nama,
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
                              widget.kost.lokasi,
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
                        widget.kost.rating.toString(),
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
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    bookmarkNotifier.setKost(widget.kost);

                    if (bookmarkNotifier.isBookmark(widget.kost)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kPrimaryColor,
                          content: Text(
                            'Has been added to the bookmark',
                            textAlign: TextAlign.center,
                            style: contentTextStyle,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Has been removed from the Wishlist',
                            textAlign: TextAlign.center,
                            style: contentTextStyle,
                          ),
                        ),
                      );
                    }
                  },
                  child: Icon(
                      bookmarkNotifier.isBookmark(widget.kost)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
