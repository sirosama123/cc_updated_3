import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/screens/request_list.dart';
import 'package:vendorapp/widgets/post_task_list.dart';
import 'package:vendorapp/widgets/smallDesc.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../widgets/BTitle2.dart';
import '../widgets/labelsField.dart';


class Post_List extends StatefulWidget {
   Post_List({super.key});

  @override
  State<Post_List> createState() => _Post_ListState();
}

class _Post_ListState extends State<Post_List> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
         appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ), 
          backgroundColor: Color(0xff034047),
          title: Text("Post Tasks"),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                PostList(status: "pending", time: "2 hours ago", topic: "cleaning"),
                SizedBox(height: 10.h,),
                PostList(status: "pending", time: "3 hours ago", topic: "cleaning"),
                SizedBox(height: 10.h,),
                PostList(status: "blocked", time: "4 hours ago", topic: "plumbering"),
                SizedBox(height: 10.h,),
                PostList(status: "pending", time: "5 hours ago", topic: "cleaning"),
                SizedBox(height: 10.h,),
                PostList(status: "pending", time: "6 hours ago", topic: "Electricity"),
                SizedBox(height: 10.h,),
                PostList(status: "blocked", time: "7 hours ago", topic: "cleaning"),
                  SizedBox(height: 20.h,),
           Container(
                          height: 48.h,
                          width:150.w,
                           decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                
                              ),
                          child: ElevatedButton(
                            onPressed: () {
                               Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RequestList()),);
                            },
                            child: Text("Accept",style: TextStyle(color: Color(0xff034047),fontWeight: FontWeight.w500),),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                )
              ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          // isExtended: true,
          child: Icon(Icons.add),
          backgroundColor: Color(0xff034047),
          onPressed: () {
            setState(() {
              
            });
          },
        ),
      ),
    )
      
    );
  }
}