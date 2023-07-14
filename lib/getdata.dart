import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Basic extends StatefulWidget {
  const Basic({Key? key}) : super(key: key);

  @override
  State<Basic> createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  var data;
  var number;

  Future<void> getData() async {
    http.Response response = await http.get(Uri.parse("http://numbersapi.com/" + numberController.text));
    print(response.body); // Print the response body
    setState(() {
      data = json.decode(response.body);
    });
    print(data);
  }


  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View the Specialty of the Number"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: numberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: "Enter a number",
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: getData,
              child: const Text("Submit"),
            ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(data.toString()),
              ),
          ],
        ),
      ),
    );
  }
}
