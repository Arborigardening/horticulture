import 'package:arbori/plant_details.dart';
import 'package:flutter/material.dart';
import 'package:arbori/plantdetailapi.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class PhotoItem {
  final String image;
  final String name;

  PhotoItem(this.image, this.name);
}

class _homeState extends State<home> {
  Details detailsService = Details();
  final List<PhotoItem> _items = [
    PhotoItem(
        "https://www.isaaa.org/kc/cropbiotechupdate/files/images/421202194321AM.jpg",
        "Brinjal"),
    PhotoItem(
        "https://back.3blmedia.com/sites/default/files/styles/ratio_3_2/public/triplepundit/wide/mccain%20foods%20regenerative%20agriculture.jpg?h=bc09f3d1",
        "Potato"),
    PhotoItem(
        "https://www.thespruce.com/thmb/iGx8FNUqlKjnl3OQFHxS0rebj5o=/941x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/top-tomato-growing-tips-1402587-11-c6d6161716fd448fbca41715bbffb1d9.jpg",
        "Tomato"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Home',
                style: TextStyle(
                  fontSize: 37,
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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 2,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            // ignore: unnecessary_new
            return new GestureDetector(
              onTap: () {
                // data(_items[index].name);
                String name = _items[index].name;
                print(_items[index].image);
                print(_items[index].name);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlantDetails(
                      name,
                      text: _items[index].name,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_items[index].image),
                  ),
                ),
              ),
            ); // Item rendering
            // return Container(
            //   padding: const EdgeInsets.all(30),
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors: [
            //           Color.fromRGBO(251, 253, 255, 1),
            //           Color.fromARGB(255, 214, 235, 255)
            //         ]),
            //   ),
            // );
          },
        ),

        // child: Center(
        //   child: Column(
        //     children: [
        //       Center(
        //         child: Text(
        //           "Home",
        //           textAlign: TextAlign.center,
        //           style: TextStyle(
        //             fontSize: 37,
        //             fontWeight: FontWeight.bold,
        //             color: Color.fromRGBO(98, 98, 98, 1),
        //           ),
        //         ),
        //       ),
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
        //       // ),
        //     ],
        //   ),
        // ),
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