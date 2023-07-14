import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


import 'listview.dart';

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user?.displayName);

      if (userCredential.user != null) {
        // Retrieve the data from Firestore
        final QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('addtitle')
            .get();

        final List<QueryDocumentSnapshot> docList = snapshot.docs;

        // Navigate to ListViewExample and pass the retrieved documents
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ListViewExample(docs: docList),
          ),
        );
      }
    } catch (e) {
      // Handle sign-in errors here
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.purple[400],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    signInWithGoogle();
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/588px-Google_%22G%22_Logo.svg.png?20230305195327',  // Replace with the actual URL of the Google logo image
                          width: 20,
                          height: 20,
                          color: Colors.white,
                          placeholder: (context, url) => CircularProgressIndicator(),  // Optional: Show a placeholder while the image is loading
                          errorWidget: (context, url, error) => Icon(Icons.error),  // Optional: Show an error icon if the image fails to load
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
