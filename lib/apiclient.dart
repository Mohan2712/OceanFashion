import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Model/AllData.dart';

class ApiClient {
  Future<AllData> fetchUsersApi() async {
    final response =
        await http.get(Uri.parse("https://api.storerestapi.com/products"));
    print("RESPONSE : " + response.body);
    Map<String, dynamic> data = jsonDecode(response.body);
    return AllData.fromJson(data);
  }
}
