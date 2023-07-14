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

  Future getData() async {
    http.Response response = await http.get(Uri.parse("https://dummyjson.com/products"));
    data = json.decode(response.body);
    setState(() {
       userData = data["products"];
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
      appBar:AppBar(
        title: Text("View Products",style: TextStyle(fontSize: 20),),
        centerTitle: true,
        backgroundColor: Color(0xFF0B0525),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                    child: Image.network(
                      userData[index]["thumbnail"],
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userData[index]["description"].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'price:${userData[index]["price"].toString()}',
                        ),
                        SizedBox(height: 4),
                        Text(
                          'discount:${userData[index]["discountPercentage"].toString()}',
                        ),
                        SizedBox(height: 4),
                        Text(
                          'rating:${userData[index]["rating"].toString()}',
                        ),
                        SizedBox(height: 4),
                        Text(
                          'stock:${userData[index]["stock"].toString()}',
                        ),
                        SizedBox(height: 4),
                        Text(
                          'brand:${userData[index]["brand"].toString()}',
                        ),
                        SizedBox(height: 4),
                        Text(
                          'category:${userData[index]["category"].toString()}',
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
    );
  }
}
