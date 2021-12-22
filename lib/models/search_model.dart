import 'dart:convert';

import 'package:kost_z/models/kost_model.dart';

class SearchKost {
  List<Kosan> kosan;

  SearchKost({
    required this.kosan,
  });

  factory SearchKost.fromJson(Map<String, dynamic> json) {
    var kost = json['kosan'] as List;
    List<Kosan> kostSearch = kost.map((i) => Kosan.fromJson(i)).toList();
    return SearchKost(kosan: kostSearch);
  }
}

List<Kosan> parseSearchKost(String json) {
  final parsed = jsonDecode(json).cast<Map<String, dynamic>>();
  return parsed.map<SearchKost>((json) => SearchKost.fromJson(json)).toList();
}
