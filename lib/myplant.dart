// import 'package:arbori/indoor_outdoorapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:arbori/Home.dart';

// class myPlant extends StatefulWidget {
//   final String recordName;
//   const myPlant(this.recordName, {required String text});
//   // const myPlant({Key? key}) : super(key: key);

//   @override
//   State<myPlant> createState() => _myPlantState();
// }

// class _myPlantState extends State<myPlant> {
//   int _value = 1;
//   @override
//   Widget build(BuildContext context) {
//     var i = 1;
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(0),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color.fromRGBO(251, 253, 255, 1),
//                 Color.fromARGB(255, 214, 235, 255)
//               ]),
//         ),
//         child: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: IconButton(
//                   icon: Image.asset('assets/images/back.png'),
//                   iconSize: 50,
//                   onPressed: () {
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => const home()));
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 2,
//               ),
//               Center(
//                 child: Text(
//                   "My Plant",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 37,
//                     fontWeight: FontWeight.w600,
//                     color: Color.fromRGBO(98, 98, 98, 1),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Column(
//                 children: [
//                   for (int i = 1; i <= 1; i++)
//                     Container(
//                       height: 150,
//                       width: double.infinity,
//                       margin:
//                           EdgeInsets.symmetric(horizontal: 45, vertical: 10),
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(children: [
//                         Container(
//                           height: 100,
//                           width: 100,
//                           margin: EdgeInsets.only(right: 15),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 30),
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   widget.recordName,
//                                   style: TextStyle(
//                                       fontSize: 19,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color.fromRGBO(98, 98, 98, 1)),
//                                 ),
//                                 Text(
//                                   "......",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.normal,
//                                       color: Color.fromRGBO(98, 98, 98, 1)),
//                                 )
//                               ]),
//                         )
//                       ]),
//                     ),
//                   Container(
//                     height: 150,
//                     width: double.infinity,
//                     margin: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(children: [
//                       Radio(
//                           value: 1,
//                           groupValue: 1,
//                           activeColor: Color.fromARGB(255, 255, 255, 255),
//                           overlayColor: MaterialStateProperty.all(
//                               Color.fromARGB(255, 148, 198, 239)),
//                           onChanged: (int? value) {
//                             // activeColor:
//                             // Color.fromRGBO(75, 227, 168, 1);
//                           }),
//                       Container(
//                         height: 100,
//                         width: 100,
//                         margin: EdgeInsets.only(right: 15),
//                       ),
//                       Padding(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Plant name",
//                                 style: TextStyle(
//                                     fontSize: 19,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color.fromRGBO(98, 98, 98, 1)),
//                               ),
//                               Text(
//                                 ".....",
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.normal,
//                                     color: Color.fromRGBO(98, 98, 98, 1)),
//                               )
//                             ]),
//                       )
//                     ]),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
            body: Container(
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
                              SizedBox(
                                width: 20,
                              )
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
    )));
  }
}
