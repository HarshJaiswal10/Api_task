import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task/model/profile_model.dart';

class RestApi {
  var client = http.Client();
  static Future<List<ProfileModel>> fetchProfile(int i) async {
    var response = await http
        .get(Uri.parse("https://reqres.in/api/users?page=" + i.toString()));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<ProfileModel> listProfileModel =
          profileModelFromJson(jsonEncode(body['data']));
      print("first name");
      print(listProfileModel[0].firstName);
      return listProfileModel;
    }
    return [];
  }
}
