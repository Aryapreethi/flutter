import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  var name=TextEditingController();
  var email=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: "phone",hintText: "phone",
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: "address",hintText: "address",
                    ),

                  ),
                ),
                ElevatedButton(onPressed: () async{
                  if(name.text.isEmpty || email.text.isEmpty)
                    {
                      print("this feild is required");
                    }else{
                    await FirebaseFirestore.instance.collection('sample').add(
                      {
                        'name':name.text,
                        'email':email.text,
                      }).then((value)=>print('success'));

                  }

                },
                    child: Text("submit"))
              ],
            ),
          )
        ],

      ),
    );
  }
}
