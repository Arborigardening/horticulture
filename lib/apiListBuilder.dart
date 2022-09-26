import 'package:flutter/material.dart';

class ApiListBuilder extends StatelessWidget {
  var results;

  ApiListBuilder({Key? key, required this.results}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History List'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) => Card(
            elevation: 6,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text('${results[index]['selection_id']}'),
              ),
              title: Text('${results[index]["selected_plant"]}'),
              // subtitle: Text('Request Date: ${results[index]["created"]}'),
              trailing: TextButton.icon(
                icon: Icon(Icons.assignment),
                label: Text('View Details'),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
