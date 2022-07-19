import 'package:arbori/signup.dart';
import 'package:flutter/material.dart';
import 'package:arbori/indoor_outdoor.dart';
import 'package:arbori/plantdetailapi.dart';

class PlantDetails extends StatefulWidget {
  // final String text;

  const PlantDetails({Key? key}) : super(key: key);

  @override
  State<PlantDetails> createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  Details detailsService = Details();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 178, 203, 224),
      body: ListView(
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
                  child: const Text(
                    "Tomato",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<List>(
            future: detailsService.getDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, i) {
                    String plant_name = snapshot.data![i]['plant'].toString();
                    return Text(plant_name);
                  },
                );
              } else {
                return Text("No data found");
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (() => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const inorout()))
            }),
        label: const Text(
          'Add',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color.fromRGBO(75, 227, 168, 1),
      ),
    );
  }
}
