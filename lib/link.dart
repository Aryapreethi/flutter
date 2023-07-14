import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Fet extends StatefulWidget {
  const Fet({Key? key}) : super(key: key);
  @override
  State<Fet> createState() => _FetState();
}
class _FetState extends State<Fet> {
  var data;
  var userData;
  Future getData() async{
    http.Response response = await http.get(Uri.parse("https://dummyjson.com/products"));
    data=json.decode(response.body);
    setState(() {
      userData=data["products"];
    });
    debugPrint(userData.toString());
  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
          itemBuilder:( context,index){
        return Card(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("ID:"),
                      // Text("${userData["id"]}"),
                      Text("${userData[index]["id"]}"),
                    ],
                  ),
                ),
                Column(
                  children:[
                    Text(userData[index]["id"].toString()),
                    Text(userData[index]["thumbnail"],),
                    Text(userData[index]["description"].toString()),
                    Text(userData[index]["price"].toString()),
                    Text(userData[index]["discountPercentage"].toString()),
                    Text(userData[index]["rating"].toString()),
                    Text(userData[index]["stock"].toString()),
                    Text(userData[index]["brand"].toString()),
                    Text(userData[index]["category"].toString()),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.green,
                      child:Image.network(userData[index]["thumbnail"],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ]
          ),
        );
      }
      ),
    );
  }
}