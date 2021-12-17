import 'package:flutter/cupertino.dart';
import 'package:kost_z/common/request_state.dart';
import 'package:kost_z/models/kost_model.dart';
import 'package:kost_z/services/api_service.dart';

class KostNotifier extends ChangeNotifier {
  final ApiService apiService;

  KostNotifier({required this.apiService}) {
    _fetchAllKost();
  }

  late KosanResult _articlesResult;
  late RequestState _state;
  String _message = '';

  String get message => _message;
  KosanResult get result => _articlesResult;
  RequestState get state => _state;

  Future<dynamic> _fetchAllKost() async {
    try {
      _state = RequestState.Loading;
      notifyListeners();
      final kost = await apiService.listKosan();
      if (kost.kosan.isEmpty) {
        _state = RequestState.Empty;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = RequestState.HasData;
        notifyListeners();
        return _articlesResult = kost;
      }
    } catch (e) {
      _state = RequestState.Error;
      notifyListeners();
      return _message = 'Conncetion Failure';
    }
  }
}