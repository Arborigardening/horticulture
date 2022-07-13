import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(251, 253, 255, 1),
        shadowColor: Colors.white,
        actions: [
          Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.menu,
                  color: Color.fromARGB(255, 33, 243, 194),
                  size: 30,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: const Icon(Icons.search,
                  color: Color.fromARGB(255, 33, 243, 194), size: 40),
            ),
          ),
          // Padding(
          //     padding: EdgeInsets.only(right: 20.0),
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: Icon(
          //         Icons.more_vert,
          //         size: 70,
          //       ),
          //     )),
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
        child: Center(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Home",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(98, 98, 98, 1),
                  ),
                ),
              ),
//               Material(
//                 elevation: 10.0,
//                 shadowColor: Color.fromARGB(255, 157, 157, 157),
//                 color: Colors.white,
//                 child: TextField(
//                   decoration: InputDecoration(
//                       prefixIcon: IconButton(
//                         onPressed: () {
//                           showSearch(
//                               context: context, delegate: CustomSearch());
//                         },
//                         icon: Icon(Icons.search),
//                         color: Color.fromARGB(255, 188, 186, 186),
//                       ),
//                       hintText: 'search',
//                       hintStyle: TextStyle(
//                           fontSize: 18,
//                           color: Color.fromARGB(255, 188, 186, 186)),
//                       fillColor: Colors.white,
//                       filled: true,
//                       contentPadding:
//                           EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(7.0),
//                           borderSide:
//                               BorderSide(color: Colors.white, width: 3.0))),
//                 ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> searchTerms = [
    "Tomato",
    "Potato",
    "Ginger",
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
