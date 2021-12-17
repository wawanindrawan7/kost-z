import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kost_z/models/kost_model.dart';

class ApiService {
  static final String _baseUrl = 'https://ggtoolkit.com/api/kosan/';
  
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
}
