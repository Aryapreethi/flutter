import 'package:flutter/material.dart';
import 'package:machinetest/register.dart';
import 'package:machinetest/view.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email=TextEditingController();
  var password=TextEditingController();
  Future<dynamic>getSava() async{

    SharedPreferences spf= await SharedPreferences.getInstance();
    var onevar=spf.getString('email');
    var pass=spf.getString('password');

    if(email.text==onevar && password.text==pass){
      const snackBar = SnackBar(content: Text("successfully logged in"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Fet();
      },
      ));


    }else{
      const snackBar = SnackBar(content: Text("something went wrong!!!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Fluttertoast.showToast(msg: "something went wrong");
    }


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
                          Navigator.push(context,MaterialPageRoute(builder: (conect)=>Login()));
                        },
                        child:Container(
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left:140.0),
                                child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.normal,fontFamily: AutofillHints.birthday),),
                              )
                          ),

                        ),

                      ),
                      // InkWell(
                      //   onTap: (){
                      //     Navigator.push(context,MaterialPageRoute(builder: (conect)=>Register()));
                      //   },
                      //   child:Container(
                      //     child: Center(
                      //         child: Padding(
                      //           padding: const EdgeInsets.only(left:100.0),
                      //           child: Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.normal),),
                      //         )
                      //     ),
                      //
                      //   ),
                      //
                      // ),

                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 600,
                      width: 500,
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
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 100.0, left: 90),
                                child: Text(
                                  "Welcome Back",
                                  style: TextStyle(
                                    color: Color(0xFF0B0525),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0, left: 100),
                                child: Text(
                                  "Sign in with your account",
                                  style: TextStyle(
                                    color: Color(0xFF0B0525),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 30.0,
                              right: 30,
                            ),
                            child: TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: "Username",
                                hintText: "Enter your email id",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 30.0,
                              right: 30,
                            ),
                            child: TextFormField(
                              controller: password,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: "Password",
                                hintText: "Enter your password",
                              ),
                              obscureText: true,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              getSava();
                              // Navigator.push(context,MaterialPageRoute(builder: (context)=>View()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 30,
                                left: 88.0,
                                right: 90.0,
                              ),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white,fontSize:20),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.lightBlue[800],
                                ),
                                height: 60,
                                width: 600,
                              ),
                            ),
                          ),
                          TextButton(onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Register()));
                          }, child: Text("Don't have any account please login here!"))





                        ],
                      ),
                    )



                  ],
                ),
              ],
            ),

          ]
      ),

    );
  }
}
