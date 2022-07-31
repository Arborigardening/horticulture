import 'package:arbori/signup.dart';
import 'package:flutter/material.dart';
import 'package:arbori/Home.dart';
import 'package:arbori/loginapi.dart';
//import 'package:flutter/src/widgets/framework.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool userCheck = true;
  bool passCheck = true;
  final userController = TextEditingController();
  final passController = TextEditingController();
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
                height: MediaQuery.of(context).size.height * .12,
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
                    labelText: "Username",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 179, 176, 176),
                    ),
                    errorText: userCheck ? null : 'Username cannot be empty',
                  ),
                  controller: userController,
                  onChanged: (String value) {
                    print(value);
                  },
                  keyboardType: TextInputType.multiline,
                  // obscureText: true,
                ),
              ),
              SizedBox(
                width: 270,
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
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 179, 176, 176),
                    ),
                    errorText: passCheck ? null : 'Password cannot be empty',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .12,
              ),
              Column(
                children: [
                  Center(
                      child: SizedBox(
                    height: 71,
                    width: 278,
                    child: ElevatedButton(
                      onPressed: () {
                        _checkLogin(); // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const home()));
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
                  // SizedBox(height: 35),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Center(
                      child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    },
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

  void _checkLogin() {
    String id = userController.text;
    String pass = passController.text;
    setState(() {
      userCheck = true;
      passCheck = true;
    });
    if (id.isEmpty) {
      setState(() {
        userCheck = false;
      });
    } else if (pass.isEmpty) {
      setState(() {
        passCheck = false;
      });
    } else {
      login(id, pass).then((value) {
        if (value) {
          print('Authenticated');

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home()));
        } else {
          print("dont have account");
          /*SizedBox(
          child: Text(
                "Dont have an account?",
                style: TextStyle(
                  fontFamily: "poppins",
                  color: Color.fromARGB(255, 53, 66, 94),
                  fontWeight: FontWeight.w600,
                ),
              ));*/
          //AlertDialog(title: Text("Sample Alert Dialog"));
          showAlertDialog(context);
        }
      });
    }
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
    content: Text("Don't have an account."),
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
