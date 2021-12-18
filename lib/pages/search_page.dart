import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kost_z/common/request_state.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/providers/search_notifier.dart';
import 'package:kost_z/services/api_service.dart';
import 'package:kost_z/widgets/search_card.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search_page';
  final String query;
  const SearchPage({required this.query});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    Widget buildSearch() {
      return ChangeNotifierProvider<SearchNotifier>(
        create: (_) => SearchNotifier(
            apiService: ApiService(Client()), query: widget.query),
        child: Consumer<SearchNotifier>(
          builder: (context, state, _) {
            if (state.state == RequestState.Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.state == RequestState.HasData) {
              if (state.result.kosan.length == 0) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tidak Bisa Menemukan Kost',
                        style: titleTextStyle.copyWith(
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.result.kosan.length,
                  itemBuilder: (context, index) {
                    var kost = state.result.kosan[index];
                    return SearchCard(kost: kost);
                  },
                );
              }
            } else if (state.state == RequestState.Empty) {
              return Center(
                child: Text(state.message),
              );
            } else if (state.state == RequestState.Error) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Center(
                child: Text(''),
              );
            }
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: kPrimaryColor,
        ),
        title: Text(
          'Search Page',
          style: titleTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: kWhiteColor,
      ),
      body: buildSearch(),
    );
  }
}
