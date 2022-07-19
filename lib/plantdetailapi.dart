import 'dart:convert';

import 'package:http/http.dart' as http;

class Details {
  String getDetailsUrl = "http://192.168.18.5:5000/api/plantdetails";
  Future<List> getDetails() async {
    try {
      var response = await http.get(Uri.parse(getDetailsUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
