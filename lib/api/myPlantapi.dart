import 'dart:convert';
import 'dart:html';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:arbori/plant_details.dart';
import 'package:arbori/login.dart';

bool flag = true;
var data;

class myPlantApi {
  static var plants;
  static Future<dynamic> trackPlant() async {
    print("track username");
    //print(id);
    print(user);
    try {
      http.Response response =
          await http.post(Uri.parse('http://127.0.0.1:5000/api/trackmyplants'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, dynamic>{'username': user}));

      if (response.statusCode == 200) {
        print(response.statusCode);
        data = json.decode(response.body);
        //plant_name=data["selected_plant"];
        //plant_id=data["selection_id"];
        myPlantApi.plants = data;
        print(data);
        print(data["selected_plant"]);
        print(data["selection_id"]);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
