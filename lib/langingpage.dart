import 'package:arbori/signup.dart';
import 'package:flutter/material.dart';
import 'package:arbori/login.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
        // color: Colors.blue,
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
        child: Column(
          children: [
            Column(
              children: [
                Center(
                  child: Image.asset("assets/images/Arbori.png"),
                ),
                SizedBox(height: 25),
                Center(
                  child: Text(
                    "Let's plant with us",
                    style: const TextStyle(
                        fontSize: 24,
                        color: Color.fromRGBO(98, 98, 98, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Center(
                  child: Image.asset("assets/images/Girl.png"),
                ),
              ],
            ),
            SizedBox(height: 50),
            Column(
              children: [
                Center(
                    child: SizedBox(
                  height: 71,
                  width: 278,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
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
                      "Get Started...",
                      style: TextStyle(
                          color: Color.fromRGBO(72, 67, 67, 1),
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )),
                SizedBox(height: 30),
                Center(
                    child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: Text(
                    "Already a member?Sign in here",
                    style: TextStyle(
                        color: Color.fromRGBO(98, 98, 98, 1), fontSize: 18),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
