import 'package:flutter/material.dart';

import 'creatertask.dart';

class Newtask extends StatefulWidget {
  const Newtask({Key? key}) : super(key: key);

  @override
  State<Newtask> createState() => _NewtaskState();
}

class _NewtaskState extends State<Newtask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFF4F2F8),
      appBar: AppBar(
        backgroundColor:Color(0xFFF4F2F8),
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          InkWell(
            onTap: () {
              // handle button press
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple,
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),

        ],
      ),
      body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0,left: 20),
              child: Row(
                children: [
                  Text("Hello,",style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal),),
                    Text( "Sriram!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Have a nice day!",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.grey),),
            ),
            Row(
              children: [
                InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.only (top:20.0,left: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      height: 50,
                      width: 90,
                      child: Center(child: Text("My task",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),)),
                    ),
                  ),
                ),
                InkWell(
                  onTap:(){},
                  child: Padding(
                    padding: const EdgeInsets.only(top:20.0,left: 10),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Colors.white70),
                      height: 50,
                      width: 90,
                      child: Center(child: Text("Project",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),)),
                    ),

                  ),
                ),
                InkWell(
                  onTap:(){},
                  child: Padding(
                    padding: const EdgeInsets.only(top:20.0,left: 10),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: Colors.white70),
                      height: 50,
                      width: 90,
                      child: Center(child: Text("Pendings",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),)),
                    ),

                  ),
                ),
              ],
            ),
                Row(
               children: [
                 InkWell(
                   onTap: (){
                     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Addtask()));
                   },
                   child: Padding(
                     padding: const EdgeInsets.only(top:40.0,left:20),
                     child: Container(
                       height: 200,
                       width: 150,
                       decoration: BoxDecoration(
                         color: Colors.purple[400],
                         borderRadius: BorderRadius.circular(20)
                       ),
                       child: Column(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(top: 10.0),
                                 child: Row(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(left: 10.0,),
                                       child: Container(
                                         height: 40,
                                         width: 40,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10),
                                           color: Colors.purple[600],
                                         ),
                                         child: Icon(
                                           Icons.person,
                                           color: Colors.white,
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 10.0,),
                                       child: Text("project",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white),),
                                     ),
                                   ],
                                 ),
                               ),
                           Row(
                           children: [
                             Padding(
                           padding: const EdgeInsets.only(left: 10,top: 20),
                           child: Text("Back End",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,color: Colors.white),),
                           ),
                           ],
                           ),

                           Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left:10.0),
                                 child: Text("Development",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,color: Colors.white),),
                                  ),
                             ],
                           ),
                           Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(top:60,left:10),
                                 child: Text("Apr 3",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,color: Colors.white),),
                               ),
                             ],
                           ),

                             ],
                           ),

                     ),
                   ),
                 ),
                 InkWell(
                   onTap: (){},
                   child: Padding(
                     padding: const EdgeInsets.only(top:40.0,left:20),
                     child: Container(
                       height: 200,
                       width: 150,
                       decoration: BoxDecoration(
                           color: Colors.purple[400],
                           borderRadius: BorderRadius.circular(20)
                       ),
                       child: Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(top: 10.0),
                             child: Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 10.0,),
                                   child: Container(
                                     height: 40,
                                     width: 40,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       color: Colors.purple[600],
                                     ),
                                     child: Icon(
                                       Icons.person,
                                       color: Colors.white,
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 10.0,),
                                   child: Text("project",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white),),
                                 ),
                               ],
                             ),
                           ),
                           Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 10,top: 20),
                                 child: Text("Back End",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,color: Colors.white),),
                               ),
                             ],
                           ),

                           Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left:10.0),
                                 child: Text("Development",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,color: Colors.white),),
                               ),
                             ],
                           ),
                           Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(top:60,left:10),
                                 child: Text("Apr 3",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,color: Colors.white),),
                               ),
                             ],
                           ),

                         ],
                       ),

                     ),
                   ),
                 )],
                ),
            Padding(
              padding: const EdgeInsets.only(top:10.0,left:8),
              child: Row(
              children: [
                Text("Progress",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 0,
                child: ListTile(
                  leading:
                  InkWell(
                    onTap: () {
                      // handle button press
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 40,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purple,
                        ),
                        child: Icon(
                          Icons.note_alt_outlined,
                          color: Colors.white,
                        ),

                      ),
                    ),
                  ),
                  title:Text("Project",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                  subtitle: Text("2 days ago",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.grey),),
                  trailing: Icon(
                    Icons.more_vert,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:5.0,left: 8,right: 8),
              child: Card(
                elevation: 0,
                child: ListTile(
                  leading:
                  InkWell(
                    onTap: () {
                      // handle button press
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 40,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purple,
                        ),
                        child: Icon(
                          Icons.note_alt_outlined,
                          color: Colors.white,
                        ),

                      ),
                    ),
                  ),
                  title:Text("Project",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                  subtitle: Text("2 days ago",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.grey),),
                  trailing: Icon(
                    Icons.more_vert,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 0,
                child: ListTile(
                  leading:
                  InkWell(
                    onTap: () {
                      // handle button press
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 40,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purple,
                        ),
                        child: Icon(
                          Icons.note_alt_outlined,
                          color: Colors.white,
                        ),

                      ),
                    ),
                  ),
                  title:Text("Project",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                  subtitle: Text("2 days ago",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.grey),),
                  trailing: Icon(
                    Icons.more_vert,
                  ),
                ),
              ),
            )



          ],
      ),
    );
  }
}
