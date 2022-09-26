import 'package:arbori/myplant.dart';
import 'package:arbori/signup.dart';
import 'package:flutter/material.dart';
import 'package:arbori/api/myPlantapi.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PlantAdded extends StatefulWidget {
  final String recordName;
  const PlantAdded(this.recordName, {required String text});
  // const PlantAdded(String recordName, {Key? key}) : super(key: key);

  @override
  State<PlantAdded> createState() => _PlantAddedState();
}

class _PlantAddedState extends State<PlantAdded> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            padding: const EdgeInsets.fromLTRB(43.0, 240.0, 43.0, 0),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(43, 0, 43, 0),
                  child: Image.asset("assets/images/Vector.png"),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    widget.recordName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(98, 98, 98, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    " added for smart care",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(98, 98, 98, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: 230,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(43, 80, 43, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        // String plant = widget.recordName;
                        // addPlant(pname: 'plant');
                        /*Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => myPlant(
                                  widget.recordName,
                                  text: '',
                                )));*/
                        checkplant();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(144, 139, 139, .3),
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
                SizedBox(
                  height: 25,
                ),
              ],
            )),
        if (loading)
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.4),
            child: const Center(child: Text('Loading')
                // child: SpinKitChasingDots(
                //   color: Colors.white,
                // ),
                ),
          )
      ]),
    );
  }

  void checkplant() {
    setState(() {
      loading = true;
    });
    myPlantApi.trackPlant().then((value) {
      setState(() {
        loading = false;
      });
      print('--$value');
      if (!loading) {
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => myPlant(
                    widget.recordName,
                    text: '',
                  )));
        });
      } else {
        print('-- $value');
      }
    });
  }
}

// bool flag = true;
// Future<bool> addPlantselected(
//   String id,
// ) async {
//   print(id);

//   try {
//     final http.Response response = await http.post(
//       Uri.parse('http://192.168.18.5:5000/api/signin'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'plant': id,
//       }),
//     );

//     print(response.statusCode);
//     print(response.body);

//     if (response.statusCode == 200) {
//       flag = true;
//       print("if");
//       print(flag);
//     } else {
//       flag = false;
//       print("else");
//       print(flag);
//       throw Exception;
//     }
//   } catch (e) {
//     flag = false;
//     print(flag);

//     throw Exception;
//   }

//   return flag;
// }

// class eaddPlant {
//   final String pname;

//   addPlant({required this.pname});

//   factory addPlant.fromJson(Map<String, dynamic> json) {
//     return addPlant(
//       plant: json['id'],
//     );
//   }
// }
