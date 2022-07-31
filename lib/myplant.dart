// import 'package:arbori/indoor_outdoorapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:arbori/Home.dart';

class myPlant extends StatefulWidget {
  final String recordName;
  const myPlant(this.recordName, {required String text});
  @override
  State<myPlant> createState() => _myPlantState();
}

class _myPlantState extends State<myPlant> {
  bool viewVisible = true;
  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Image.asset('assets/images/back.png'),
            iconSize: 50,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const home()));
            },
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Center(
          child: Text(
            "My Plant",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 37,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(98, 98, 98, 1),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
          height: 220,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(7),
              child: Stack(children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 130, 0, 0),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          'https://www.wur.nl/upload_mm/d/c/b/0f99b95f-970d-4664-8af1-b62f56601ec2_moringa-seed-pods_4190bbd1_750x400.jpg',
                                        ),
                                      ))),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
          height: 220,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(7),
              child: Stack(children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      ],
    )));
  }
}
