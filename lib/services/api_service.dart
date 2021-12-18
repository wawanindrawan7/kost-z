import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kost_z/models/kost_model.dart';
import 'package:kost_z/models/search_model.dart';

class ApiService {
  static final String _baseUrl = 'https://ggtoolkit.com/api/kosan';

  final http.Client client;
  ApiService(this.client);

  Future<KosanResult> listKosan() async {
    final response = await client.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return KosanResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list');
    }
  }

  Future<SearchKost> searchKost(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + '?key=' + query));
    if (response.statusCode == 200) {
      return SearchKost.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data search kost');
    }
  }
}
