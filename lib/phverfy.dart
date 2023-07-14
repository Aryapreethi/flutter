import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  String _verificationId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              child: Text('Send OTP'),
            ),
            SizedBox(height: 16.0),
            PinCodeTextField(
              controller: _otpController,
              appContext: context,
              length: 6,
              onChanged: (value) {},
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signInWithPhoneNumber,
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  void _verifyPhoneNumber() async {
    String phoneNumber = '+91${_phoneNumberController.text}';
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // User is automatically signed in on verification completion
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  void _signInWithPhoneNumber() async {
    String otp = _otpController.text;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp,
    );
    try {
      await _auth.signInWithCredential(credential);
      // User is signed in successfully
    } catch (e) {
      print(e.toString());
    }
  }
}
