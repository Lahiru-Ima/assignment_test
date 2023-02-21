import 'dart:convert';

import 'package:assignment_mypos/data/users.dart';

import '../config.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<List<Datatable>?> getUser() async {
    final response = await http.get(
      Uri.parse("${Config.USER_URL}/ims/unit/list"),
      headers: {"X-Tenant": "gayashan"},
    );

    if (response.statusCode == 200) {
      var obj = jsonDecode(response.body);
      // print(obj['data']['datatable']);
      return obj['data']['datatable'].map<Datatable>((json) {
        return Datatable.fromJson(json);
      }).toList();
    }
  }
}
