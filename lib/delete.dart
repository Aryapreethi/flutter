import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class New1 extends StatefulWidget {
  final List<QueryDocumentSnapshot> docs;

  const New1({Key? key, required this.docs}) : super(key: key);

  @override
  _New1State createState() => _New1State();
}

class _New1State extends State<New1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.docs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.docs.elementAt(index)['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.docs.elementAt(index)['name']),
                Text(widget.docs.elementAt(index)['email']),
                // Text(widget.docs.elementAt(index)['number']),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Formmm()),
                        // );
                      },
                      icon: Icon(Icons.add, color: Colors.purple),
                    ),
                    IconButton(
                      onPressed: () async{
                        await widget.docs[index].reference.delete();
                        setState(() {
                          widget.docs.removeAt(index);
                        });

                      },
                      icon: Icon(Icons.delete, color: Colors.purple),
                    ),
                  ],

                ),
              ],
            ),
          );
        },
      ),
    );
  }
}