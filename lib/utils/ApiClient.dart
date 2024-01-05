import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApiClient extends ChangeNotifier {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<List<Map<String, dynamic>>> get(String endpoint) async {
    final response = await http.get(Uri.parse(baseUrl + endpoint));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}