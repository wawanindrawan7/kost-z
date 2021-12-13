import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';

class BookmarkPage extends StatelessWidget {
  static const routeName = '/bookmark_page';
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.book_rounded,
          color: Colors.purple,
          size: 30,
        ),
        title: Text(
          'Bookmark Page',
          style: titleTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: kWhiteColor,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(top: 10),
                height: 300,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(18)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/kos3/kost_3_1.jpeg',
                          ),
                        ),
                      ),
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
                                'Kost Nabila',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Lombok Tengah',
                                        style: titleTextStyle.copyWith(
                                            fontSize: 12),
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
                                    '4.5',
                                    style: titleTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
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
            ],
          ),
        ),
      ),
    );
  }
}
