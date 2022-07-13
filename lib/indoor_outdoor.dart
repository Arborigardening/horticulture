import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:arbori/plant_added.dart';
import 'package:arbori/plant_details.dart';

class inorout extends StatefulWidget {
  const inorout({Key? key}) : super(key: key);

  @override
  State<inorout> createState() => _inoroutState();
}

class _inoroutState extends State<inorout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0),
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
              SizedBox(
                  height: 20,
                ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    icon: Image.asset('assets/images/back.png'),
                    iconSize: 50,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PlantDetails()));
                    },
                  ),
              ),
              SizedBox(
                height: 2,
              ),
              Center(
                child: Text(
                  "Indoor or Outdoor",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(98, 98, 98, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(children: [
                      Radio(
                          value: "",
                          groupValue: "",
                          activeColor: Color.fromRGBO(75, 227, 168, 1),
                          onChanged: (index) {}),
                      Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.only(right: 15),
                        child: Image.asset("assets/images/indoor.jpg"),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Indoor",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(98, 98, 98, 1)),
                              ),
                              Text(
                                "(balcony..)",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromRGBO(98, 98, 98, 1)),
                              )
                            ]),
                      )
                    ]),
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(children: [
                      Radio(
                          value: "",
                          groupValue: "",
                          activeColor: Color.fromRGBO(75, 227, 168, 1),
                          onChanged: (index) {}),
                      Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.only(right: 15),
                        child: Image.asset("assets/images/outdoor.jpg"),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Outdoor",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(98, 98, 98, 1)),
                              ),
                              Text(
                                "(garden..)",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromRGBO(98, 98, 98, 1)),
                              )
                            ]),
                      )
                    ]),
                  )
                ],
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
                    labelText: "Location",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 179, 176, 176),
                    ),
                  ),
                ),
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
                    labelText: "Planted Date",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 179, 176, 176),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70),
              Column(
                children: [
                  Center(
                      child: SizedBox(
                    height: 63,
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PlantAdded()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(75, 240, 171, 0.89),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(35.0),
                        ),
                        padding: EdgeInsets.all(10),
                        // color: Colors.white,
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
                  // SizedBox(height: 35),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
