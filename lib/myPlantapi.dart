import 'dart:convert';
import 'dart:html';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:arbori/plant_details.dart';

bool flag = true;

class myplant {
  Future<dynamic> trackPlant(String id) async {
    print("track username");
    print(id);
    try {
      final http.Response response = await http.post(
        Uri.parse('http://192.168.1.2:5000/api/trackmyplants'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': id,
        }),
      );

      print(response.body);

      if (response.statusCode == 200) {
        flag = true;
        print("if");
        print(flag);

        return jsonDecode(response.body);
        // return response.body;
      } else {
        flag = false;
        print("else");
        print(flag);
        return Future.error('Server error');
        // throw Exception;
      }
    } catch (e) {
      flag = false;
      print(flag);
      return Future.error(e);
      // throw Exception;
    }

    // return flag;
  }
}

class myPlant {
  final String username;

  myPlant({
    required this.username,
  });

  factory myPlant.fromJson(Map<String, dynamic> json) {
    return myPlant(
      username: json['id'],
    );
  }
}
