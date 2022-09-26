// import 'package:arbori/indoor_outdoorapi.dart';
import 'package:arbori/api/myPlantapi.dart';
import 'package:flutter/material.dart';
import 'package:arbori/Home.dart';
import 'package:arbori/login.dart';

import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter_tts/flutter_tts.dart';

import 'api/photos.dart';

// import 'package:arbori/Home.dart';
var t = data.toString();

class myPlant extends StatefulWidget {
  final String recordName;
  const myPlant(this.recordName, {required String text});
  @override
  State<myPlant> createState() => _myPlantState();
}

enum TtsState { playing, stopped, paused, continued }

class _myPlantState extends State<myPlant> {
  late FlutterTts flutterTts;
  String? language;
  String? engine;
  double volume = 1.0;
  double pitch = 1.3;
  double rate = 0.7;
  bool isCurrentLanguageInstalled = false;

  String _newVoiceText = "Hellloooooooooo";
  int? _inputLength;

  TtsState ttsState = TtsState.stopped;

  // bool get isAndroid => Platform.isAndroid;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    // if (isAndroid) {
    //   _getDefaultEngine();
    //   _getDefaultVoice();
    // }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _getDefaultEngine() async {
    await flutterTts.getDefaultEngine;
  }

  Future _getDefaultVoice() async {
    await flutterTts.getDefaultVoice;
  }

  Future _speak({required text}) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    // if (text != null) {
    //   if (text!.isNotEmpty) {
    await flutterTts.speak(text);
    //   }
    // }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

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
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  Container containerWrapper(
      {required String imgLink, required String id, required String name}) {
    return Container(
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
                              child: Image.network("$imgLink"),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text("$id. ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(98, 98, 98, 1))),
                            Text("$name",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(98, 98, 98, 1))),
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
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(myPlantApi.plants);
    print(myPlantApi.plants["selected_plant"].length);
    print(
        Photos.images[Photos.imgmap[myPlantApi.plants["selected_plant"][0]]!]);
    print(Photos.imgmap[myPlantApi.plants["selected_plant"][0]]);
    print(t);
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
                  print(user);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const home()));
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
            // Column(mainAxisSize: MainAxisSize.min, children: [

            // containerWrapper(
            //   imgLink:
            //       '${Photos.images[Photos.imgmap[int.parse(myPlantApi.plants["selected_plant"][0])]!].image}',
            //   id: '${myPlantApi.plants["selection_id"][0]}',
            //   name:
            //       '${Photos.images[int.parse(myPlantApi.plants["selected_plant"][0])].name}',
            // ),

            // for (int i = 0; i < myPlantApi.plants["selected_plant"].length; i++)
            //   containerWrapper(
            //     imgLink: Photos
            //         .images[
            //             Photos.imgmap[myPlantApi.plants["selected_plant"][i]]!]
            //         .image,
            //     id: myPlantApi.plants["selection_id"][i].toString(),
            //     name:
            //         Photos.images[myPlantApi.plants["selected_plant"][i]].name,
            //   ),

            // }
            // ]),
            containerWrapper(
              imgLink: Photos.images[0].image,
              id: '0',
              name: Photos.images[0].name,
            ),
            containerWrapper(
              imgLink: '${Photos.images[4].image}',
              id: '9',
              name: '${Photos.images[4].name}',
            ),
            // containerWrapper(
            //   imgLink: Photos.images[2].image,
            //   id: '2',
            //   name: Photos.images[2].name,
            // ),
            // containerWrapper(
            //   imgLink: Photos.images[3].image,
            //   id: '3',
            //   name: Photos.images[3].name,
            // ),
            // containerWrapper(
            //   imgLink: Photos.images[4].image,
            //   id: '4',
            //   name: Photos.images[4].name,
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  String text =
                      "$user there water the plant ${myPlantApi.plants["selected_plant"][0]} ${myPlantApi.plants["selection_id"][0]} . \n" +
                          user +
                          " give the fertilizer : compost, to the cabbage 9.";
                  /*user +
                      " there might be rain today you dont need to water the plant cauliflower with id 4.\n" +
                      user +
                      " give the fertilizer : compost, to the tomato with id 0"*/

                  showAlertDialog(context, text);
                  _speak(text: text);
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
                  "test",
                  style: TextStyle(
                      color: Color.fromRGBO(72, 67, 67, 1),
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String text) {
  var text =
      "$user there water the plant ${myPlantApi.plants["selected_plant"][0]} ${myPlantApi.plants["selection_id"][0]} . \n" +
          user +
          " give the fertilizer : compost, to the cabbage 9.";
  /*user +
      " there might be rain today you dont need to water the plant cauliflower with id 4.\n" +
      user +
      " give the fertilizer : compost, to the tomato with id 0"*/
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(""),
    content: Text(text),
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
