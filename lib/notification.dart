import 'dart:convert';
import 'dart:html';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:arbori/plant_details.dart';
import 'package:arbori/login.dart';

bool flag = true;
String plant_name="";
String plant_id="";
class myplant {
  Future<dynamic> trackPlant() async {
    print("track username");
    //print(id);
    print(user);
    try {
      final http.Response response = await http.post(
        Uri.parse('http://192.168.1.2:5000/api/dailyupdate'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': user,
        }),
      );
      print(response.statusCode);
      var data=json.decode(response.body);
      //plant_name=data["selected_plant"];
      //plant_id=data["selection_id"];
      print(data["selected_plant"]);
      print(data["selection_id"]);
      

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }

    // return flag;
  }
}

/*class myPlant {
  //final String username;
  final String selected_plant;
  final String selection_id;
  //final String start_date;


  myPlant({
    //required this.username,
    required this.selected_plant,
    required this.selection_id,
    //required this.start_date,
  });

  factory myPlant.fromJson(Map<String, dynamic> json) {
    return myPlant(
      // username: json['username'] as String,
      selected_plant: json['selected_plant'] as String,
      selection_id: json['selection_id'] as String,
      // start_date: json['start_date'] as String,
      
    );
  }
}*/
