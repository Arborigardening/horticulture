import 'package:arbori/plant_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  // Details detailsService = Details();

  // selectedPlant s = selectedPlant();
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
    PhotoItem("https://c4.wallpaperflare.com/wallpaper/201/234/498/cucumbers-green-cucumbers-wallpaper-preview.jpg",
        "cucumber"),  
    PhotoItem('https://media.istockphoto.com/photos/senior-farmer-holding-fresh-kale-cabbage-picture-id1251268220?b=1&k=20&m=1251268220&s=170667a&w=0&h=7IbJWggPvqjyOmqpFWrMLq_-sMDyXEzVeJ5-zK6NgZQ=', 
        'cabbage'),
    PhotoItem('https://media.istockphoto.com/photos/organic-cauliflower-on-wooden-background-picture-id506469515?k=20&m=506469515&s=170667a&w=0&h=xKy3ID9iKSJNgGaGRm6Mw6iFMloGQ0L82A7Ai6SJhj0=',
        'cauliflower'),  
    PhotoItem('https://media.istockphoto.com/photos/pineapple-fruit-on-the-bush-picture-id953010954?k=20&m=953010954&s=612x612&w=0&h=zamOAKTrHFy_GUHM19c24nDYcqMgZlw6Rvg2MhrG0Gw=', 
        'pineapple'),   
    PhotoItem('https://media.istockphoto.com/photos/okra-ladys-finger-gombo-gumbo-bendee-green-herb-on-stalk-picture-id621099742?k=20&m=621099742&s=612x612&w=0&h=RHG_4Tcm_6UqW0N80uN4XSz9T9zZQrZaC81IGg7F_fU=', 
        'ladys finger'),
    PhotoItem('https://thumbs.dreamstime.com/b/fresh-green-beans-plant-garden-macro-closeup-summer-outdoor-32867237.jpg', 
        'beans'),
    PhotoItem('https://t3.ftcdn.net/jpg/04/14/95/44/360_F_414954430_twzkzQcciiegUNRQWxF38rjRa21Xp6PZ.jpg', 
        'white gourd'),
    PhotoItem('https://thumbs.dreamstime.com/b/snake-gourd-2579415.jpg', 
        'snake gourd'),
    PhotoItem('https://gardenerspath.com/wp-content/uploads/2020/06/How-to-Grow-Pumpkins-FB.jpg',
        'pumpkin'),
    PhotoItem('https://cdn.shopify.com/s/files/1/0488/7855/1202/products/cucumber-lemon-s105_e48bf3ce-ee23-48b7-bfec-ee2103cb183e_1200x.jpg?v=1637121797', 
        'blonde cucumber'),
    PhotoItem('https://media.istockphoto.com/photos/freshly-dug-carrots-with-tops-on-the-ground-large-juicy-unwashed-in-picture-id1256809289?k=20&m=1256809289&s=612x612&w=0&h=XPFWsPIep2yATGWYVPz50YOmmF3VkxC8QNGYg3cxCAQ=',
        'carrot'),
    PhotoItem('https://cdn.shopify.com/s/files/1/3013/3652/products/EF_YAM_Chena.jpg?v=1540154591',
        'elephant yam'),
    PhotoItem('https://st2.depositphotos.com/28132718/49501/i/450/depositphotos_495019402-stock-photo-taro-root-white-background-colocasia.jpg?forcejpeg=true', 
        'colocasia'),
    PhotoItem('https://thumbs.dreamstime.com/b/rambutan-tree-sweet-fruit-many-people-like-popular-thailand-rambutan-tree-sweet-fruit-156176488.jpg',
        'rambutan'),
    PhotoItem('https://c8.alamy.com/zooms/9/2157e18d401e4122ab0dd01aba89ffce/erf60k.jpg', 
        'ivy gourd'),
    PhotoItem('https://media.istockphoto.com/photos/red-pepper-picture-id603889840?b=1&k=20&m=603889840&s=170667a&w=0&h=ueWkRa9YTbXMK-GBhTx2AKaFIyuIqXQACYPqVYjcxB8=', 
        'chili'),
    PhotoItem('https://www.gardeningknowhow.com/wp-content/uploads/2021/05/green-and-red-sweet-pepper-tree.jpg', 
        'capsicum'),
    PhotoItem('https://media.istockphoto.com/photos/japanese-radish-picture-id1221092019?k=20&m=1221092019&s=612x612&w=0&h=iXJWuhB4RVM7LkObIa2W5LTzrCTj7OrCfE6xfjOHN6g=', 
        'raddish'),    
    PhotoItem('https://cdn.shopify.com/s/files/1/1992/8047/articles/4_1_852x.jpg?v=1537934890', 
        'beetroot'), 
    PhotoItem('https://www.almanac.com/sites/default/files/styles/landscape/public/image_nodes/spinach_by_deyan_georgiev_ss.jpg?itok=xIhxN95r', 
        'spinach'),
    PhotoItem('https://i.pinimg.com/736x/28/86/5a/28865a1941e027e4e9d7bbf71ad2077f.jpg', 
        'passion fruit'),
    PhotoItem('https://plantogram.com/wa-data/public/shop/products/08/02/208/images/1185/1185.970.jpg', 
        'guava'),
    PhotoItem('https://m.media-amazon.com/images/I/61rqOHlg9YL._AC_SL1500_.jpg', 
        'mangosteen'),
    PhotoItem('http://cdn.shopify.com/s/files/1/0047/9730/0847/articles/Banana-Plant-with-Ripe-Fruit.jpg?v=1630345545', 
        'banana'), 
    PhotoItem('https://thumbs.dreamstime.com/b/lemon-tree-18089850.jpg', 
        'lemon'),
    PhotoItem('https://soonhuatseeds.com/wp-content/uploads/2020/12/bitter-gourd.png', 
        'bitter gourd'),
    PhotoItem('https://c1.wallpaperflare.com/preview/627/388/884/oranges-fruits-orange-tree-citrus-fruits.jpg', 
        'orange'), 
    PhotoItem('https://upload.wikimedia.org/wikipedia/commons/0/08/Flacourtia_inermis.jpg', 
        'runeala plum'),
    PhotoItem('https://www.wur.nl/upload_mm/d/c/b/0f99b95f-970d-4664-8af1-b62f56601ec2_moringa-seed-pods_4190bbd1_750x400.jpg', 
        'drumstick'),
    PhotoItem('https://img.freepik.com/premium-photo/rose-apple-plant_38196-507.jpg', 
        'water apple'),
    PhotoItem('https://t4.ftcdn.net/jpg/00/97/87/35/360_F_97873533_FlL14LwJgbvpE6m6Hofo2BCPnOkPwxN2.jpg', 
        'sapodilla'),
    PhotoItem('https://m.media-amazon.com/images/I/51gtLIO16JL._SX466_.jpg', 
        'black pepper'),
    PhotoItem('https://t4.ftcdn.net/jpg/04/00/43/93/360_F_400439343_LkhyW0A505tFKLoyXfysfNMpuNyJD6GP.jpg', 
        'chinese potato'),
    PhotoItem('https://cdn.britannica.com/19/231119-050-35483892/Indian-ginger-Zingiber-officinale.jpg', 
        'ginger'),
    PhotoItem('https://t3.ftcdn.net/jpg/03/30/30/94/360_F_330309413_1GCy01jOT01AQWNVLoMQSluhmmXNSKFJ.jpg', 
        'turmeric'),                                                                                                                 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Home',
                style: TextStyle(
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
            crossAxisCount: 2,
          ),
          itemCount: 38,
          itemBuilder: (context, index) {
            // ignore: unnecessary_new
            return new GestureDetector(
              onTap: () {
                // data(_items[index].name);
                String name = _items[index].name;
                // s.selected(name);
                // print(_items[index].image);
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
              child: Card(
                child:Container(
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
                    style:TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      backgroundColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ),
              /*child: Card(
                child: Container(
                      height: 290,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              /*Expanded(
                                child: Image.network(
                                  'https://tech.pelmorex.com/wp-content/uploads/2020/10/flutter.png',
                                  fit: BoxFit.fill,
                                ),
                              ),*/
                               Container(
                                decoration: BoxDecoration(
                                image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(_items[index].image),
                    	          ),
                              ),
                              ),
                              Text(
                                'Title',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),]
              ),],),)*/
            );// Item rendering
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
