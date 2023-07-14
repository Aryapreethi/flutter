import 'package:flutter/material.dart';

class Addtask extends StatefulWidget {
  const Addtask({Key? key}) : super(key: key);

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7E69B4),
      appBar: AppBar(
        title: Text("Create New Task"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF7E69B4),
        leading: Icon(
          Icons.arrow_back,

        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Container(
              width: 100,
              height: 50.0,
              child: TextField(
                decoration: InputDecoration(
                  label: Text("Title",style: TextStyle(color: Colors.white),),
                  border:UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
