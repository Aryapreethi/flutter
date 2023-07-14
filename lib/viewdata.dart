import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task1/add.dart';

class Datzz extends StatefulWidget {

  final List<QueryDocumentSnapshot<Object?>> docs;
  const Datzz({Key? key,  required this.docs }) : super(key: key);

  @override
  State<Datzz> createState() => _DatzzState();
}

class _DatzzState extends State<Datzz> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title:Text("view"),
    ),
      // body: ListView.builder(
      //
      //   itemCount: widget.docs.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       title: Text(widget.docs.elementAt(index)['email']),
      //       subtitle: Text(widget.docs.elementAt(index)['name']),
      //       trailing: ElevatedButton(onPressed: (){
      //         Navigator.push(context,MaterialPageRoute(builder: (context)=>Add()));
      //       }, child: Text("add")),
      //     );
      //   },
      // ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Add()),
                        );
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
