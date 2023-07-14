import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'addtitle.dart';


class ListViewExample extends StatefulWidget {
  final List<QueryDocumentSnapshot<Object?>> docs;

  const ListViewExample({Key? key, required this.docs}) : super(key: key);

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.purple[200],
        title: const Text(
          "Notes",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: widget.docs.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.black,
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5.0,
                            ),
                            Expanded(
                              child: Text(
                                widget.docs.elementAt(index)['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor
        :Colors.purple[200],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CameraScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
