import 'dart:html';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(43.0, 140.0, 43.0, 0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(251, 253, 255, 1),
                Color.fromARGB(255, 214, 235, 255)
              ])),
          child: Column(
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                    color: Color.fromRGBO(72, 67, 67, 1),
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 0),
                height: 100,
              ),
              Container(
                width: 304,
                height: 61,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6.0,
                        color: Color.fromRGBO(75, 227, 168, 0.6),
                        offset: Offset(0, 5),
                      ),
                    ]),
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(
                    height: 2,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),

                    //hintText: "Name",
                    labelText: "username",
                    labelStyle: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 131, 129, 129),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 0),
                height: 61,
              ),
              Container(
                width: 304,
                height: 61,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6.0,
                        color: Color.fromRGBO(75, 227, 168, 0.6),
                        offset: Offset(0, 5),
                      ),
                    ]),
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(
                    height: 2,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 131, 129, 129),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 0),
                height: 61,
              ),
              Container(
                width: 304,
                height: 61,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6.0,
                        color: Color.fromRGBO(75, 227, 168, 0.6),
                        offset: Offset(0, 5),
                      ),
                    ]),
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(
                    height: 2,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 131, 129, 129),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 0),
                height: 100,
              ),
              Container(
                width: 250,
                height: 61,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Colors.white,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(35.0),
                    ),
                    padding: EdgeInsets.all(20),
                    // color: Colors.white,
                  ),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        color: Color.fromRGBO(72, 67, 67, 1),
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
