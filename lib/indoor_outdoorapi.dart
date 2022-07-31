import 'dart:convert';
import 'dart:html';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:arbori/indoor_outdoor.dart';

bool flag = true;
Future<bool> addPlantselected(
  String id,
) async {
  print(id);

  try {
    final http.Response response = await http.post(
      Uri.parse('http://192.168.1.2:5000/api/addplant'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'plant': id,
      }),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      flag = true;
      print("if");
      print(flag);
    } else {
      flag = false;
      print("else");
      print(flag);
      throw Exception;
    }
  } catch (e) {
    flag = false;
    print(flag);

    throw Exception;
  }

  return flag;
}

class addPlant {
  final String plant;

  addPlant({required this.plant});

  factory addPlant.fromJson(Map<String, dynamic> json) {
    return addPlant(
      plant: json['id'],
    );
  }
}
