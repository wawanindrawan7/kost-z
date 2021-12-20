import 'package:flutter/cupertino.dart';
import 'package:kost_z/common/request_state.dart';
import 'package:kost_z/models/search_model.dart';

import 'dart:async';

import 'package:kost_z/services/api_service.dart';
import 'package:logger/logger.dart';

class SearchNotifier extends ChangeNotifier {
  final ApiService apiService;

  SearchNotifier({required this.apiService});

  SearchKost? _restaurantSearch;
  RequestState? _state;
  String _message = '';

  String get message => _message;
  SearchKost? get result => _restaurantSearch;
  RequestState? get state => _state;
  Logger _logger = Logger();

  Future<dynamic> fecthRestaurantSearch(String query) async {
    try {
      _state = RequestState.Loading;
      notifyListeners();
      final restoSearch = await apiService.searchKost(query);
      if (restoSearch.kosan.isEmpty) {
        _state = RequestState.Empty;
        notifyListeners();
      } else {
        _state = RequestState.HasData;
        notifyListeners();
        _logger.d(restoSearch.kosan.length);
        return _restaurantSearch = restoSearch;
      }
    } catch (e) {
      _state = RequestState.Error;
      notifyListeners();
    }
  }
}
