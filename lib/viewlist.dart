import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'crud.dart';

class VList extends StatefulWidget {
  const VList({Key? key}) : super(key: key);

  @override
  State<VList> createState() => _VListState();
}

class _VListState extends State<VList> {
  var sp;
  List<String> myList = [];
  Future<dynamic> getData() async {
    final SharedPreferences spf = await SharedPreferences.getInstance();

    var sp = spf.getStringList('name');
    print('-----------------$sp');

    return sp;
  }

  Future removeData(data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // Retrieve the list from shared preferences
    List<String>? myList = sharedPreferences.getStringList('name');

    // Check if the list exists and contains the item
    if (myList != null && myList.contains(data)) {
      // Remove the item from the list
      myList.remove(data);

      // Store the updated list back into shared preferences
      await sharedPreferences.setStringList('name', myList);
    }
  }

  Future<void> updateData(String oldItem, String newItem) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // Retrieve the list from shared preferences
    List<String>? myList = sharedPreferences.getStringList('name');

    // Check if the list exists and contains the old item
    if (myList != null && myList.contains(oldItem)) {
      // Get the index of the old item
      int index = myList.indexOf(oldItem);

      // Update the item at the specific index
      myList[index] = newItem;

      // Store the updated list back into shared preferences
      await sharedPreferences.setStringList('name', myList);
    }
  }

  String? updatedValue; // Variable to store the updated value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View List"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Text(snapshot.data[index]),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                removeData(snapshot.data[index]);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return VList();
                                  }),
                                );
                              },
                              icon: Icon(Icons.delete, color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {
                                // Handle edit functionality
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Update Item'),
                                    content: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          updatedValue = value; // Store the updated value
                                        });
                                      },
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          // Call updateData() with the old item and new item
                                          updateData(
                                            snapshot.data[index],
                                            updatedValue ?? '', // Use the updated value
                                          );
                                          Navigator.pop(context);
                                        },
                                        child: Text('Update'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: Icon(Icons.edit, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
