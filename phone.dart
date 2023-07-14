import 'package:auth/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Phone extends StatefulWidget {
  const Phone({Key? key}) : super(key: key);
  static String verify="";

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  late String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Hey! What\'s your phone number?',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Enter your mobile number below and get an OTP to activate your account',
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(width: 0),
                          ),
                          labelText: 'Enter your phone number',
                        ),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          setState(() {
                            phone = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        FirebaseAuth auth = FirebaseAuth.instance;

                        await auth.verifyPhoneNumber(
                          phoneNumber: '+91$phone',
                          verificationCompleted: (PhoneAuthCredential credential) async {
                            await auth.signInWithCredential(credential);
                          },
                          verificationFailed: (FirebaseAuthException error) {
                            print('Verification failed: ${error.message}');
                          },
                          codeSent: (String verificationId, int? forceResendingToken) {
                            Phone.verify = verificationId;
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Otp()),
                            );
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      },
                      child: const Text('Get OTP'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
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
