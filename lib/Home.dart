import 'dart:html';

import 'package:arbori/plant_details.dart';
import 'package:arbori/vegAndFruit/banana.dart';
import 'package:arbori/vegAndFruit/beans.dart';
import 'package:arbori/vegAndFruit/beetroot.dart';
import 'package:arbori/vegAndFruit/cabbage.dart';
import 'package:arbori/vegAndFruit/carrot.dart';
import 'package:arbori/vegAndFruit/cauliflower.dart';
import 'package:arbori/vegAndFruit/chilli.dart';
import 'package:arbori/vegAndFruit/cucumber.dart';
import 'package:arbori/vegAndFruit/lemon.dart';
import 'package:arbori/vegAndFruit/pumpkin.dart';
import 'package:arbori/vegAndFruit/rambutan.dart';
import 'package:arbori/vegAndFruit/snakegourd.dart';
import 'package:arbori/vegAndFruit/whitegourd.dart';
import 'package:arbori/vegAndFruit/tomato.dart';
import 'package:arbori/api/brinjal.dart';
import 'package:arbori/vegAndFruit/potato.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:arbori/api/plantdetailapi.dart';
import './api/photos.dart';

String img = "";

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  // Details detailsService = Details();

  // selectedPlant s = selectedPlant();
  final List<PhotoItem> _items = Photos.images;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Home',
                style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(98, 98, 98, 1),
                ))),
        backgroundColor: Color.fromRGBO(251, 253, 255, 1),
        shadowColor: Colors.white,
        actions: [
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Icon(
          //       Icons.menu,
          //       color: Color.fromARGB(255, 33, 243, 194),
          //       size: 30,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: const Icon(Icons.search,
                  color: Color.fromARGB(255, 33, 243, 194), size: 40),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.more_vert,
                  size: 70,
                ),
              )),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(251, 253, 255, 1),
                Color.fromARGB(255, 214, 235, 255)
              ]),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 2,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
          ),
          itemCount: 38,
          itemBuilder: (context, index) {
            return new GestureDetector(
              onTap: () {
                // data(_items[index].name);
                String name = _items[index].name;
                // s.selected(name);
                // print(_items[index].image);
                img = _items[index].image;
                print(_items[index].name);
                if (name == "Tomato") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tomato(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "Brinjal") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Brinjal(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "Potato") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Potato(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "banana") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Banana(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "beans") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Beans(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "beetroot") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Beetroot(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "cabbage") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cabbage(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "carrot") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Carrot(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "cauliflower") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cauliflower(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "chilli") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chilli(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "cucumber") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cucumber(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "lemon") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Lemon(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "pumpkin") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pumpkin(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "rambutan") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Rambutan(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "white gourd") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Whiteguard(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else if (name == "snake gourd") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Snakegourd(
                        name,
                        text: _items[index].name,
                      ),
                    ),
                  );
                } else
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Brinjal(
                          name,
                          text: _items[index].name,
                        ),
                      ),
                    );
                  };
              },
              child: Card(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 130, 0, 0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_items[index].image),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _items[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        backgroundColor: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> searchTerms = [
    "Tomato",
    "Potato",
    "Brinjal",
    "Onion",
  ];
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) => Container();
  // {
  //   List<String> matchQuery = [];
  //   for (var plant in searchTerms) {
  //     if (plant.toLowerCase().contains(query.toLowerCase())) {
  //       matchQuery.add(plant);
  //     }
  //   }
  //   return ListView.builder(
  //     itemCount: matchQuery.length,
  //     itemBuilder: (context, index) {
  //       var result = matchQuery[index];
  //       return ListTile(
  //         title: Text(result),
  //       );
  //     },
  //   );
  // }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var plant in searchTerms) {
      if (plant.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(plant);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
