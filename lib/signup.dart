import 'dart:html';
import 'package:arbori/Home.dart';
import 'package:arbori/plant_details.dart';
import 'package:arbori/login.dart';
import 'package:flutter/material.dart';
import 'package:arbori/api/signupapi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late Future<Account> _futureAlbum;
  bool val = true;

  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0),
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
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Image.asset('assets/images/back.png'),
                  iconSize: 50,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                ),
              ),
              SizedBox(
                height: 75,
              ),
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
                  controller: userController,
                  onChanged: (String value) {
                    print(value);
                  },
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
                  controller: emailController,
                  onChanged: (String value) {
                    print(value);
                  },
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
                  controller: passController,
                  onChanged: (String value) {
                    print(value);
                  },
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
                  onPressed: () {
                    // created(
                    //   userController.text,
                    //   emailController.text,
                    //   passController.text,
                    // );
                    createAccount(
                      userController.text,
                      emailController.text,
                      passController.text,
                    ).then((value) => {
                          if (value)
                            {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const home()))
                            }
                          else
                            {
                              //print("Error");
                              showAlertDialog(context)
                            }
                        });
                  },
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

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("Username already existing. Use a unique username."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
