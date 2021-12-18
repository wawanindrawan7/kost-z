import 'package:flutter/cupertino.dart';
import 'package:kost_z/models/kost_model.dart';

class BookmarkNotifier extends ChangeNotifier {
  List<Kosan> _bookmark = [];

  List<Kosan> get bookmark => _bookmark;

  set bookmark(List<Kosan> bookmark) {
    _bookmark = bookmark;
    notifyListeners();
  }

  setKost(Kosan kost) {
    if (!isBookmark(kost)) {
      _bookmark.add(kost);
    } else {
      _bookmark.removeWhere((element) => element.id == kost.id);
    }
    notifyListeners();
  }

  isBookmark(Kosan kost) {
    if (_bookmark.indexWhere((element) => element.id == kost.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
