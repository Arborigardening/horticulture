import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
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
            Container(
                //color: Colors.pink,

                //margin: const EdgeInsets.only(left: 10.0),
                margin: const EdgeInsets.only(
                  top: 36.0,
                  left: 30.0,
                ),
                child: Center(
                  child: Image.asset("assets/images/Arbori.png"),
                )),
            Container(
                //color: Colors.blue,
                //margin: const EdgeInsets.only(top: 10.0, left: 30.0),
                child: Center(
              child: Text(
                "Lets plant with us",
                style: const TextStyle(fontSize: 24),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
