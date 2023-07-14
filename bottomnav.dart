import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validation/reg.dart';
import 'package:validation/valid.dart';

class Navg extends StatefulWidget {
  const Navg({Key? key}) : super(key: key);

  @override
  State<Navg> createState() => _NavgState();
}

class _NavgState extends State<Navg> {
  int currentindex=0;
  final pages=[
    Validate(),
    Register(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
      ),
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
     onTap: (newIndex){
          setState(() {
            currentindex=newIndex;
          });
     },
     items: [
       BottomNavigationBarItem(icon: Icon(
         Icons.home,
       ),
         label: "home",
       ),
       BottomNavigationBarItem(icon: Icon(
         Icons.person,
       ),
         label: "profile"
       ),

     ],
      ),
    );
  }
}
