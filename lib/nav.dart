import 'package:flutter/material.dart';
import 'newtask.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentindex = 0;
  final pages = [
    Newtask(),
    Newtask(),
    Newtask(),
    Newtask(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        currentIndex: currentindex,
        onTap: (newindex) {
          setState(() {
            currentindex = newindex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label:"",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
            ),
            label:"",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label:"",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label:"",
          ),
        ],
      ),
    );
  }
}
