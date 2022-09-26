import 'package:flutter/material.dart';
import 'api/myPlantapi.dart';
import 'api/photos.dart';

class apiListBuilder2 extends StatelessWidget {
  const apiListBuilder2({Key? key}) : super(key: key);

  Container containerWrapper(
      {required String imgLink, required String id, required String name}) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
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
                              child: Image.network(imgLink, fit: BoxFit.cover),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text("$id.",
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
                            SizedBox(height: 10, width: 10),
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
            )
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History List'),
      ),
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: myPlantApi.plants["selected_plant"].length,
          itemBuilder: (context, index) => containerWrapper(
            imgLink: Photos
                .images[
                    Photos.imgmap[myPlantApi.plants["selected_plant"][index]]!]
                .image,
            id: myPlantApi.plants["selection_id"][index].toString(),
            name:
                Photos.images[myPlantApi.plants["selected_plant"][index]].name,
          ),
        ),
      ),
    );
  }
}
