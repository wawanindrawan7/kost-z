import 'package:flutter/cupertino.dart';
import 'package:kost_z/common/request_state.dart';
import 'package:kost_z/db/database_helper.dart';
import 'package:kost_z/models/kost_model.dart';

class DatabaseNotiifier extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseNotiifier({required this.databaseHelper}) {
    _getFavorites();
  }

  late RequestState _state;
  RequestState get state => _state;

  String _message = '';
  String get message => _message;

  List<Kosan> _favorites = [];
  List<Kosan> get favorites => _favorites;

  void _getFavorites() async {
    _favorites = await databaseHelper.getFavorites();
    if (_favorites.length > 0) {
      _state = RequestState.HasData;
    } else {
      _state = RequestState.Empty;
      _message = 'Empty Bookmark';
    }
    notifyListeners();
  }

  void addFavorites(Kosan kost) async {
    try {
      await databaseHelper.insertFavorite(kost);
      _getFavorites();
    } catch (e) {
      _state = RequestState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorited(int id) async {
    final favoritedRestaurant = await databaseHelper.getFavoriteById(id);
    return favoritedRestaurant.isNotEmpty;
  }

  void removeFavorite(int id) async {
    try {
      await databaseHelper.removeFavorite(id);
      _getFavorites();
    } catch (e) {
      _state = RequestState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
