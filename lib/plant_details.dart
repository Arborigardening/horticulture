import 'dart:html';
import 'package:arbori/Home.dart';
import 'package:arbori/signup.dart';
import 'package:flutter/material.dart';
import 'package:arbori/indoor_outdoor.dart';
import 'package:arbori/plantdetailapi.dart';

class PlantDetails extends StatefulWidget {
  final String recordName;
  const PlantDetails(this.recordName, {required String text});

  // const PlantDetails({Key? key, required this.text}) : super(key: key)

  // @override
  @override
  State<PlantDetails> createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  // Details detailsService = Details();
  plantdetail p = plantdetail();
  // selectedPlant s = selectedPlant();
  var plantDet;

  @override
  Widget build(BuildContext context) {
    // Plant c = Plant();
    var result = '';
    var name;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 178, 203, 224),
        body: ListView(
          children: [
            // Text(result!),
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
                      builder: (context) => const MyHomePage()));
                },
              ),
            ),
            SizedBox(
              width: 300,
              height: 194,
            ),
            Container(
              //margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              height: 571,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 200, 0),
                    child: Text(
                      widget.recordName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                  ),

                  // Text(p.createPlant(widget.recordName)),
                  FutureBuilder<dynamic>(
                    future: p.createPlant(widget
                        .recordName), // future: detailsService.getDetails(),
                    builder: (context, snapshot) {
                      print("builder");
                      print(widget.recordName);
                      print(snapshot.data.toString());

                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          print("snapshot Data");
                          plantDet = snapshot.data.toString();
                          // print(snapshot.data?.length);
                          // return ListView.builder(
                          //   scrollDirection: Axis.vertical,
                          //   shrinkWrap: true,
                          //   itemCount: snapshot.data?.length,
                          //   itemBuilder: (context, i) {
                          //     String plantName =
                          //         snapshot.data![i]['plant'].toString();
                          //     print(plantName);
                          //     setState(() {
                          //       result = plantName;
                          //     });
                          //     // return Text(plantName);
                          //   },
                          // );
                        }
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          // itemCount: snapshot.data?.length,
                          itemCount: plantDet.length + 1,
                          itemBuilder: (context, i) {
                            // String plantName =
                            // return documentSnapshot['plant'];
                            // print(plantDet);
                            // setState(() {
                            //   result = plantDet;
                            // });
                            return Text(plantDet);
                          },
                        );
                      } else if (snapshot.hasError) {
                        print("snapshot error");
                        return const Center(
                          child: CircularProgressIndicator(),
                          // child: Text("No data found",
                          //     style: TextStyle(
                          //       color: Colors.blueGrey,
                          //       fontSize: 32,
                          //       fontWeight: FontWeight.w600,
                          //     )),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  )
                ],
              ),
            ),
          ],
        ),

        //     FutureBuilder<List>(
        //       future: p.createPlant(
        //           widget.recordName), // future: detailsService.getDetails(),
        //       builder: (context, snapshot) {
        //         print("builder");
        //         if (snapshot.hasData) {
        //           print("if snapshot");
        //           return ListView.builder(
        //             scrollDirection: Axis.vertical,
        //             shrinkWrap: true,
        //             itemCount: snapshot.data?.length,
        //             itemBuilder: (context, i) {
        //               String plantName = snapshot.data![i]['plant'].toString();
        //               print(snapshot.data![i]['plant'].data.toString());
        //               return Text(plantName);
        //             },
        //           );
        //         } else {
        //           print("plant snapshot error");
        //           return const Center(
        //             child: Text("No data found",
        //                 style: TextStyle(
        //                   color: Colors.blueGrey,
        //                   fontSize: 32,
        //                   fontWeight: FontWeight.w600,
        //                 )),
        //           );
        //         }
        //       },
        //     )
        //   ],
        // ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (() => {
                // name = s.plant(),
                // print("plantdet name pass"),
                // print(name),
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => inorout(
                          widget.recordName,
                          text: '',
                        )))
              }),
          label: const Text(
            'Add',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Color.fromRGBO(75, 227, 168, 1),
        ));
  }
}

// class selectedPlant {
//   late String id;
//   String plantName = '';
//   selectedPlant(this.id) {
//     plantName = id;
//   }

//   factory selectedPlant.fromJson(Map<String, dynamic> json) {
//     return plantName;
//   }
// }
