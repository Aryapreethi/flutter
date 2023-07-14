import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:googlesignin/signin.dart';
import 'camera_screen.dart';
import 'listview.dart';
import 'main.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final TextEditingController title = TextEditingController();

  bool isCameraOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text("Add Details"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: title,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Add Title",
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      isCameraOpen = true;
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      _navigateToCameraScreen();
                    },
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text("Open Camera"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFCE93D8)),
                  ),

                  onPressed: () async {
                    if (title.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: "This field is required",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                      );
                    } else {
                      await FirebaseFirestore.instance
                          .collection('addtitle')
                          .add({
                        'title': title.text,
                      }).then((value) {
                        Fluttertoast.showToast(
                          msg: "Note saved",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );

                        // Retrieve the updated data from Firestore and pass it to ListViewExample
                        FirebaseFirestore.instance
                            .collection('addtitle')
                            .get()
                            .then((snapshot) {
                          List<QueryDocumentSnapshot> docList = snapshot.docs;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ListViewExample(docs: docList),
                            ),
                          );
                        });
                      });
                    }
                  },
                  child: Text("Save"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToCameraScreen() async {
    final cameras = await availableCameras();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraPage(cameras: cameras),
      ),
    );
  }

}

