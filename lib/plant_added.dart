import 'package:flutter/material.dart';

class PlantAdded extends StatefulWidget {
  const PlantAdded({Key? key}) : super(key: key);

  @override
  State<PlantAdded> createState() => _PlantAddedState();
}

class _PlantAddedState extends State<PlantAdded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(43.0, 240.0, 43.0,0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(251, 253, 255, 1),
              Color.fromARGB(255, 214, 235, 255)
            ]
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(43, 0, 43, 0),
              child: Image.asset("assets/images/Vector.png"),
            ),
            SizedBox(height: 25,),
            Center(
              child: Text(
                "Plant_name added for smart care",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(98,98,98,1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 230,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(43, 80, 43, 0),
                child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(144,139,139,.3),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(35.0),
                        ),
                        padding: EdgeInsets.all(20),
                      ),
                      child: Text(
                        "Done",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
              ),
            ),
            SizedBox(height: 25,),    
      ],)
        ),
    );
  }
}
