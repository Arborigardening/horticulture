import 'dart:async';
import 'dart:convert';

import 'package:arbori/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:arbori/Home.dart';

bool flag = true;
Future<bool> data(
  String id,
  String email,
  String password,
) async {
  print(
    id,
  );
  print(email);
  print(password);
  try {
    final http.Response response = await http.post(
      Uri.parse('http://192.168.1.2:5000/api/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': id,
        'email': email,
        'password': password,
      }),
    );

    print(response.statusCode);

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

class Account {
  final String username;
  final String email;
  final String password;

  Account(
      {required this.username, required this.email, required this.password});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      username: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }
}
