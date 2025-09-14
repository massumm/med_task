import 'dart:convert';
import 'package:http/http.dart' as http;

import '../res/app_urls.dart';

class ApiService {


  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("${AppUrls.baseUrl}/login"),
      headers: {
        "x-api-key": "reqres-free-v1",
        "Content-Type": "application/json"
      },
      body: {"email": email, "password": password},
    );

    print(response.body.toString);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {};
    }
  }
}
