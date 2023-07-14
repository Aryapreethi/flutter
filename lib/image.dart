// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Stack(
//           children: [
//             Image.asset(
//               'lib/assets/image/1175429479.jpg', // Replace with your image path
//               fit: BoxFit.cover,
//               height: double.infinity,
//               width: double.infinity,
//             ),
//             BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//               child: Container(
//                 color: Colors.black.withOpacity(0.3), // Adjust the opacity as needed
//               ),
//             ),
//             Center(
//               child: Text(
//                 'Hello, World!',
//                 style: TextStyle(fontSize: 32, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
