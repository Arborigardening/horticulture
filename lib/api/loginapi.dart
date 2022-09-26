import 'dart:async';
import 'dart:convert';

import 'package:arbori/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<bool> login(String id, String pass) async {
  print(id);
  print('Login Invoked');

  try {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        /*"Access-Control-Allow-Origin": "*", // Required for CORS support to work
        //"Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS",*/
      },
      body: jsonEncode(<String, String>{'username': id, 'password': pass}),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
