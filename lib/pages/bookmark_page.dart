import 'package:flutter/material.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/providers/bookmark_notifier.dart';
import 'package:kost_z/widgets/bookmark_card.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatelessWidget {
  static const routeName = '/bookmark_page';
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookmarkNotifier bookmarkNotifier = Provider.of<BookmarkNotifier>(context);

    Widget content() {
      return Container(
        child: ListView(
          children: bookmarkNotifier.bookmark
              .map(
                (kost) => BookmarkCard(kost: kost),
              )
              .toList(),
        ),
      );
    }

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
      body: content(),
    );
  }
}
