import 'dart:ui';
import 'package:arbori/Home.dart';
import 'package:arbori/signup.dart';
import 'package:flutter/material.dart';
import 'package:arbori/indoor_outdoor.dart';
import 'package:arbori/api/plantdetailapi.dart';

class Brinjal extends StatefulWidget {
  final String recordName;
  const Brinjal(this.recordName, {required String text});

  // const PlantDetails({Key? key, required this.text}) : super(key: key)

  // @override
  @override
  State<Brinjal> createState() => _BrinjalState();
}

class _BrinjalState extends State<Brinjal> {
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
      backgroundColor: const Color.fromARGB(255, 178, 203, 224),
      body: ListView(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: const AssetImage("assets/images/tomato 1.png"),
                fit: BoxFit.cover,
              ),
            ),
            // height: 200,
            // width: 350,
            // margin: EdgeInsets.only(right: 15),
            // child:
            //     Image.asset("assets/images/tomato 1.png", fit: BoxFit.cover),

            // Text(result!),

            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Image.asset('assets/images/back.png'),
                    iconSize: 50,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const home()));
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                ),

                // Container(
                // child:Image.asset('assets/images/tomato 1.png'),),
                /*SizedBox(
              width: 300,
              height: 194,
            ),*/
                Container(
                  margin: const EdgeInsets.only(top: 150),
                  height: 885,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 200, 0),
                        child: Text(
                          widget.recordName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Planting Season: June- July",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Chemicals: nitrogen,phosphorous,potash hybrid",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Fertilizer: NPK:10-10-10,Diluted manure tea",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Rainfall: moderate",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Sunshine: 6-7 hrs/day direct",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Temperature: 13cel-21cel",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Description: They can be grown from seed sown directly in the ground, but because they take a long time to fruit, speed up the process by growing them in trays four weeks before planting time, then plant the seeds when the ground warms up.  Seeds will take about 2-3 weeks to germinate. Seedlings should be spaced about 45-60 cm i.e. 1.5 to 2 ft apart. Take optimum care while transplanting as it might disturb the plant growth. The plant will fruit after 3-4 months.",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Harvesting time: 120-130",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // Text(p.createPlant(widget.recordName)),
                      /*FutureBuilder<dynamic>(
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
                  )*/
                    ],
                  ),
                ),
              ],
            ),
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
        ],
      ),
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
        backgroundColor: const Color.fromRGBO(75, 227, 168, 1),
      ),
    );
  }
}
