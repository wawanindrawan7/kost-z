import 'package:flutter/cupertino.dart';
import 'package:kost_z/common/request_state.dart';
import 'package:kost_z/models/search_model.dart';

import 'dart:async';

import 'package:kost_z/services/api_service.dart';
import 'package:logger/logger.dart';

class SearchNotifier extends ChangeNotifier {
  final ApiService apiService;

  SearchNotifier({required this.apiService});

  SearchKost? _kostSearch;
  RequestState? _state;
  String _message = '';

  String get message => _message;
  SearchKost? get result => _kostSearch;
  RequestState? get state => _state;
  Logger _logger = Logger();

  Future<dynamic> fecthKostSearch(String query) async {
    try {
      _state = RequestState.Loading;
      notifyListeners();
      final kostSearch = await apiService.searchKost(query);
      if (kostSearch.kosan.isEmpty) {
        _state = RequestState.Empty;
        notifyListeners();
      } else {
        _state = RequestState.HasData;
        notifyListeners();
        _logger.d(kostSearch.kosan.length);
        return _kostSearch = kostSearch;
      }
    } catch (e) {
      _state = RequestState.Error;
      notifyListeners();
    }
  }
}
