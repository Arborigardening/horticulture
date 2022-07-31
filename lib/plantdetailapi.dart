import 'dart:convert';
import 'dart:html';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:arbori/plant_details.dart';

bool flag = true;

class plantdetail {
  Future<dynamic> createPlant(String id) async {
    print(id);
    try {
      // var params = {"plant": "id"};

      // var newURI =
      // Uri.http(''192.168.18.5:5000','/api/plantdetails', {'plant':'id'});
      final http.Response response = await http.post(
        Uri.parse('http://192.168.1.2:5000/api/plantdetails'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'plant': id,
        }),
      );

      // print(response.body);

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

class Plant {
  final String plant;

  Plant({
    required this.plant,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      plant: json['id'],
    );
  }
}

// class Details {
//   String getDetailsUrl = "http://192.168.18.5:5000/api/plantdetails";
//   Future<List> getDetails() async {
//     try {
//       var response = await http.get(Uri.parse(getDetailsUrl));
//       if (response.statusCode == 200) {
//         print("details :");
//         print(response.body);
//         return jsonDecode(response.body);
//       } else {
//         return Future.error('Server error');
//       }
//     } catch (e) {
//       return Future.error(e);
//     }
//   }
// }
