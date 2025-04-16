import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> fetchData(String url) async {
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final data = jsonDecode(response.body);
  return data;
}
