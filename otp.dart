import 'package:auth/phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';

import 'home.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var code="";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Phone()),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Verification your phone number',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Enter the code',
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Pinput(
                      length: 6,
                      onChanged: (value){
                        code=value;
                      },
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Didn\'t receive SMS?',
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.grey),
                    ),

                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        PhoneAuthCredential credential = PhoneAuthProvider
                            .credential(
                            verificationId: Phone.verify,
                            smsCode: code);

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) {
                          return HomePage();
                        }));
                      }
                      catch(e){
                        Fluttertoast.showToast(
                            msg: "wrong otp!!try again",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    }, child: Text("ok"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
