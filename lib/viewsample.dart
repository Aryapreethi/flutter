import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task1/viewdata.dart';

class View extends StatefulWidget {
const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("view"),
        centerTitle: true,
      ),
  body: Center(
          child:ElevatedButton(onPressed: ()  async {
            await FirebaseFirestore.instance.collection('sample').get().then((snapshot)
                {
                  List<QueryDocumentSnapshot> docList=snapshot.docs;
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return Datzz(docs:docList);
                  }));
                });
          },
          child: Text('submit'),)

  ),
    );
  }
}

