import 'dart:async';
import 'dart:convert';
// import './user_profile.dart';
import 'package:arbori/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import '../widgets/loginWidget.dart';

// String access_token = '';
// String refresh_token = '';
// String rf = '';
String api = 'https://ce1e-2001-df7-5280-2e84-a92d-b0ae-346-32ac.in.ngrok.io';

// class AuthUser {
//   final String access_token;
//   final String refresh_token;

//   const AuthUser({required this.access_token, required this.refresh_token});
//   factory AuthUser.fromJson(Map<String, dynamic> json) {
//     return AuthUser(
//         access_token: json['access'], refresh_token: json['refresh']);
//   }
// }

// Future<Login> _createAuthUser(String id, String pass) async {
//   final response = await http.post(
//     Uri.parse(
//         'https://ce1e-2001-df7-5280-2e84-a92d-b0ae-346-32ac.in.ngrok.io/api/login'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{'username': id, 'password': pass}),
//   );
//   print("hi");
//   print('Response status: ${response.statusCode}');
//   // if (response.body == "account found") {
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     print("angel");
//     return AuthUser.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to convert!');
//   }
// }

Future<bool> login(String id, String pass) async {
  print(id);
  print('Login Invoked');
  // Future<AuthUser> au;
  try {
    print("hi");
    print(id);
    print(pass);
    final response = await http.post(
      Uri.parse(
          'http://ce1e-2001-df7-5280-2e84-a92d-b0ae-346-32ac.in.ngrok.io/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'username': id, 'password': pass}),
    );
    print(response.body);
    print("hi");
    // print('Response status: ${response.statusCode}');
    // if (response.body == "account found") {
    if (response.statusCode == 200) {
      print("angel");
      return true;
      // return AuthUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to convert!');
    }
  } catch (e) {
    print('Error');

    return false;
  }
  return true;
}

// Future<AuthUser> _LogoutUser(String refreshToken) async {
//   final response = await http.post(
//     Uri.parse(
//         'https://6537-2001-df7-5280-2e84-a92d-b0ae-346-32ac.in.ngrok.io/api/logout'), // TODO
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'refresh_token': refreshToken,
//     }),
//   );
//   print(response.body);
//   if (response.statusCode == 200) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.

//     return jsonDecode(response.body);
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to convert!');
//   }
// }

// Future<bool> logout() async {
//   print('Logout Invoked');
//   Future<AuthUser> au;
//   try {
//     // print(refresh_token);
//     await _LogoutUser(refresh_token).then((value) {});
//   } catch (e) {
//     // print('Error');
//     return true;
//   }
//   return true;
// }
