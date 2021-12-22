import 'package:flutter/material.dart';
import 'package:kost_z/common/request_state.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/providers/search_notifier.dart';
import 'package:kost_z/widgets/search_card.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search_page';
  final String query;
  const SearchPage({required this.query});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Widget _buildTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: Offset(0, 4),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: TextField(
        onSubmitted: (query) {
          Provider.of<SearchNotifier>(context, listen: false)
              .fecthKostSearch(query);
        },
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 17),
          hintText: 'Search',
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(14),
        ),
      ),
    );
  }

  _buildSearchResult() {
    return Consumer<SearchNotifier>(
      builder: (context, kost, child) {
        if (kost.state == RequestState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (kost.state == RequestState.HasData) {
          if (kost.result!.kosan.length == 0) {
            return Center(child: Text('Data Kosong'));
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: kost.result!.kosan.length,
                itemBuilder: (context, index) {
                  return SearchCard(kost: kost.result!.kosan[index]);
                },
              ),
            );
          }
        } else {
          return Center(
              child: Container(
            height: 300,
            width: 300,
            child: Lottie.asset('assets/not_found.json'),
          ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.search,
          color: Colors.purple,
          size: 30,
        ),
        title: Text(
          'Search Page',
          style: titleTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: kWhiteColor,
      ),
      body: Column(
        children: [
          _buildTextField(),
          SizedBox(
            height: 10,
          ),
          _buildSearchResult()
        ],
      ),
    );
  }
}
