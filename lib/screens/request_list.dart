import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/widgets/post_task_list.dart';
import 'package:vendorapp/widgets/requestTask.dart';
import 'package:vendorapp/widgets/smallDesc.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../widgets/BTitle2.dart';
import '../widgets/labelsField.dart';



class RequestList extends StatefulWidget {
  const RequestList({super.key});

  @override
  State<RequestList> createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
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
          title: Text("Request Lists"),
        ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
                SizedBox(height: 10.h,),
                RequestTask(status: "approved", topic: "cleaning", id: "1234"),
                SizedBox(height: 10.h,),
                RequestTask(status: "rejected", topic: "cleaning", id: "4547"),
                SizedBox(height: 10.h,),
                RequestTask(status: "approved", topic: "cleaning", id: "8686"),
                SizedBox(height: 10.h,),
                RequestTask(status: "rejected", topic: "cleaning", id: "7776"),
                SizedBox(height: 10.h,),
                RequestTask(status: "approved", topic: "cleaning", id: "3566"),
                SizedBox(height: 10.h,),
            ],
          ),
        ),
      ),
     ),
    );
  }
}