import 'package:flutter/material.dart';
import 'package:machinetest/viewlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

  TextEditingController data=TextEditingController();
  List<String> myList = [];
  Future<dynamic> getData() async {
    var na = data.text;
    myList.add(na);
    SharedPreferences spf = await SharedPreferences.getInstance();
   var pf= spf.setStringList('name', myList);
    print(pf);
    print(myList);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("curd operation"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded( // Wrap TextField with Expanded
                    child: Padding(
                      padding: const EdgeInsets.only(top:60.0),
                      child: TextField(
                        controller: data,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Enter a text",
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:90.0),
                    child: ElevatedButton(
                      onPressed: () {
                        getData();
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return VList();
                        }));
                      },
                      child: Text("Submit"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>VList()));
                      },
                      child: Text("Next"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),


    );
  }
}
