import 'package:flutter/cupertino.dart';
import 'package:kost_z/common/request_state.dart';
import 'package:kost_z/models/search_model.dart';

import 'dart:async';

import 'package:kost_z/services/api_service.dart';

class SearchNotifier extends ChangeNotifier {
  final ApiService apiService;

  SearchNotifier({required this.apiService, required String query}) {
    _fecthKostSearch(query);
  }

  late SearchKost _kostSearch;
  late RequestState _state;
  String _message = '';

  String get message => _message;
  SearchKost get result => _kostSearch;
  RequestState get state => _state;

  Future<dynamic> _fecthKostSearch(String query) async {
    try {
      _state = RequestState.Loading;
      notifyListeners();
      final kostSearch = await apiService.searchKost(query);
      if (kostSearch.kosan.isEmpty) {
        _state = RequestState.Empty;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = RequestState.HasData;
        notifyListeners();
        print(kostSearch);
        return _kostSearch = kostSearch;
      }
    } catch (e) {
      _state = RequestState.Error;
      notifyListeners();
      return _message = "Connection failed";
    }
  }
}
