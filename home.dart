import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/img/panda.jpg'), // Replace with your own image path
            fit: BoxFit.cover,
          ),
        ),
        // child: Center(
        //   child: Text(
        //     'Welcome to the Home Page',
        //     style: TextStyle(
        //       fontSize: 24,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.yellowAccent ,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
