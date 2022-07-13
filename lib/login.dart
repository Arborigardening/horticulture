import 'package:flutter/material.dart';
import 'package:arbori/Home.dart';
//import 'package:flutter/src/widgets/framework.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(251, 253, 255, 1),
                Color.fromARGB(255, 214, 235, 255)
              ]),
        ),
        child: Center(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Welcome\nto\nA r b o r i",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(98, 98, 98, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                width: 270,
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(
                    height: 2,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 179, 176, 176),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ),
              SizedBox(height: 110),
              Column(
                children: [
                  Center(
                      child: SizedBox(
                    height: 71,
                    width: 278,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const home()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(35.0),
                        ),
                        padding: EdgeInsets.all(20),
                        // color: Colors.white,
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Color.fromRGBO(72, 67, 67, 1),
                            fontSize: 26,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
                  SizedBox(height: 35),
                  Center(
                      child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Don’t have an account?Sign Up",
                      style: TextStyle(
                          color: Color.fromRGBO(98, 98, 98, 1), fontSize: 18),
                    ),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
