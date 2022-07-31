// import 'package:arbori/indoor_outdoorapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:arbori/Home.dart';

// class myPlant extends StatefulWidget {
//   final String recordName;
//   const myPlant(this.recordName, {required String text});
//   @override
//   State<myPlant> createState() => _myPlantState();
// }

// class _myPlantState extends State<myPlant> {
//   bool viewVisible = true;
//   void showWidget() {
//     setState(() {
//       viewVisible = true;
//     });
//   }

//   void hideWidget() {
//     setState(() {
//       viewVisible = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             body: Column(
//       children: [
//         Align(
//           alignment: Alignment.topLeft,
//           child: IconButton(
//             icon: Image.asset('assets/images/back.png'),
//             iconSize: 50,
//             onPressed: () {
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => const home()));
//             },
//           ),
//         ),
//         SizedBox(
//           height: 2,
//         ),
//         Center(
//           child: Text(
//             "My Plant",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 37,
//               fontWeight: FontWeight.w600,
//               color: Color.fromRGBO(98, 98, 98, 1),
//             ),
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
//           height: 220,
//           width: double.maxFinite,
//           child: Card(
//             elevation: 5,
//             child: Padding(
//               padding: EdgeInsets.all(7),
//               child: Stack(children: <Widget>[
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Stack(
//                     children: <Widget>[
//                       Padding(
//                           padding: const EdgeInsets.only(left: 10, top: 5),
//                           child: Column(
//                             children: <Widget>[
//                               Row(
//                                 children: <Widget>[
//                                   Container(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           0, 130, 0, 0),
//                                       decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: NetworkImage(
//                                           'https://www.wur.nl/upload_mm/d/c/b/0f99b95f-970d-4664-8af1-b62f56601ec2_moringa-seed-pods_4190bbd1_750x400.jpg',
//                                         ),
//                                       ))),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ))
//                     ],
//                   ),
//                 )
//               ]),
//             ),
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
//           height: 220,
//           width: double.maxFinite,
//           child: Card(
//             elevation: 5,
//             child: Padding(
//               padding: EdgeInsets.all(7),
//               child: Stack(children: <Widget>[
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Stack(
//                     children: <Widget>[
//                       Padding(
//                           padding: const EdgeInsets.only(left: 10, top: 5),
//                           child: Column(
//                             children: <Widget>[
//                               Row(
//                                 children: <Widget>[
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ))
//                     ],
//                   ),
//                 )
//               ]),
//             ),
//           ),
//         ),
//       ],
//     )));
//   }
// }// import 'package:arbori/indoor_outdoorapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// import 'package:arbori/Home.dart';

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
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Image.asset('assets/images/back.png'),
                iconSize: 50,
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => const home()));
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
              height: 200,
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
                              padding: const EdgeInsets.only(left: 10, top: 20),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 100,
                                        width: 100,
                                        margin: EdgeInsets.only(right: 15),
                                        child: Image.asset(
                                            "assets/images/tomato 1.png",
                                            fit: BoxFit.cover),
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Text("1. ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(
                                                  98, 98, 98, 1))),
                                      Text("Cauliflower",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(
                                                  98, 98, 98, 1))),
                                      SizedBox(height: 10, width: 10),
                                      Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.delete,
                                              size: 30,
                                            ),
                                          )),
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
              padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
              height: 200,
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
                              padding: const EdgeInsets.only(left: 10, top: 20),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 100,
                                        width: 100,
                                        margin: EdgeInsets.only(right: 15),
                                        child: Image.asset(
                                            "assets/images/tomato 1.png"),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text("2. ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(
                                                  98, 98, 98, 1))),
                                      Text("Tomato",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(
                                                  98, 98, 98, 1))),
                                      SizedBox(height: 10, width: 30),
                                      Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.delete,
                                              size: 30,
                                            ),
                                          )),
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
        ),
      ),
    );
  }
}
