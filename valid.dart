import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Validate extends StatefulWidget {
  const Validate({Key? key}) : super(key: key);

  @override
  State<Validate> createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {
  final formkey=GlobalKey<FormState>();
  final password=TextEditingController();
  final confpassword=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("validation"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child:Form(
            key: formkey,
            child:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (val){
                      if(val!.isEmpty){
                        return "username cannot be empty";
                      }
                      else if(val.length<4){
                        return "must be atleast four characters long";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "username",
                      hintText: "enter the username",
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(20.0),)
                    ),
                    keyboardType: TextInputType.name,

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (val){
                      if(val!.isEmpty){
                        return "password must";
                      }
                      else if(val.length<8){
                        return "must be 8 character long";
                      }
                      return null;
                    },
                    controller: password,
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "enter the Password",
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(20.0),)
                    ),
                    obscureText: true,

                  ),
                ) ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (val){
                      if(val!=password.value.text){
                        return "password doesnot mach";
                      }
                      return null;
                    },
                    controller: confpassword,
                    decoration: InputDecoration(
                        labelText: "confirm password",
                        hintText: "confirm password",
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(20.0),)
                    ),
                    obscureText: true,

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){
                    if(formkey.currentState!.validate()){
                      debugPrint("all validation passed");
                    }
                  }, child: Text("login"),),
                ),
              ],

            ),
          ),

        ),
      ),
    );
  }
}
