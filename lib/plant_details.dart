import 'package:flutter/material.dart';

class PlantAdded extends StatefulWidget {
  const PlantAdded({Key? key}) : super(key: key);

  @override
  State<PlantAdded> createState() => _PlantAddedState();
}

class _PlantAddedState extends State<PlantAdded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:Color.fromARGB(255, 178, 203, 224),
      body:Column(
          children: [SizedBox(
            width: 300,
            height: 280,
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
                  padding: EdgeInsets.fromLTRB(0,15,200, 0),
                  child: const Text(
                    "Aloe Vera",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 30,
                      
                      ),
                      ),
                ),
            
              ],
            ),
          ),
            
          ],
        ),
         floatingActionButton: FloatingActionButton.extended(
          onPressed: (() => {}),
 
   label: const Text('Add',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
   backgroundColor: Color.fromRGBO(75, 227, 168, 1),
), 
    );
  }
}