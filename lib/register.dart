import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name=TextEditingController();
  var phone=TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController();
  Future<void>getData() async{
    var na=name.text;
    var ph=phone.text;
    var em=email.text;
    var ps=password.text;
    // print(na);

    // var a = email.text
    SharedPreferences spf= await SharedPreferences.getInstance();
    spf.setString('name', na);
    spf.setString('phone', ph);
    spf.setString('email', em);
    spf.setString('password', ps);
    // var sp=spf.getString('name');
    // var pp=spf.getString('email');
    // var cc=spf.getString('password');
    // print(sp);
    // print(pp);
    // print(cc);
    const snackBar = SnackBar(content: Text("successfully  registered"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Login();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF0B0525),
      appBar: AppBar(
        // title: Text("login"),
        backgroundColor:Color(0xFF0B0525),
      ),
      body: ListView(
          children:[
            Column(
              children: [
                Container(
                  color:Color(0xFF0B0525),
                  child: Row(
                    children: [

                      InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (conect)=>Register()));
                        },
                        child:Container(
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left:120.0),
                                child: Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.normal),),
                              )
                          ),

                        ),

                      ),

                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 600,
                      width:500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:10.0,left: 90),
                                  child: Text("Welcome Back",style: TextStyle(color: Color(0xFF0B0525),fontWeight: FontWeight.bold,fontSize: 25),),
                                ),
                              ]
                          ),
                          Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:4.0,left: 100),
                                  child: Text("Sign in with your account",style: TextStyle(color: Color(0xFF0B0525),fontSize: 13),),
                                ),
                              ]
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:20,left:30.0,right: 30,),
                            child: TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  labelText:"name",hintText: "enter your name"
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top:8,left:30.0,right: 30,),
                            child: TextFormField(
                                controller: phone,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    labelText:"phone",hintText: "phone"
                                ),
                                keyboardType: TextInputType.number
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:20,left:30.0,right: 30,),
                            child: TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  labelText:"email",hintText: "enter your email id"
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:20,left:30.0,right: 30,),
                            child: TextFormField(
                              controller: password,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  labelText:"password",hintText: "password"
                              ),
                              obscureText: true,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              getData();
                              // Navigator.push(context,MaterialPageRoute(builder: (context)=>Cat()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top:10,left: 88.0,right: 90.0),
                              child: Container(
                                child: Center(child: Text('Register',style: TextStyle(color: Colors.white),)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.lightBlue[800]
                                ),
                                height:60,
                                width: 500,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ],
            ),
          ]
      ),

    );
  }
}
