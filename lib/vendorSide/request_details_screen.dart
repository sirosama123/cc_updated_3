import 'package:another_stepper/another_stepper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:vendorapp/vendorSide/stepper1.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/titleTune.dart';

import '../provider/provider1.dart';
import '../widgets/BTitle2.dart';
import '../widgets/smallDesc.dart';
import '../widgets/title3.dart';



class Request_Service_Details extends StatelessWidget {
String profile;
String name;
String time_of_post;
String address;
String datee;
String budget;
String detail;
String timee;
String doc_uid;
String uid;
String service;
String user_doc;
String doc;
String oid;
Request_Service_Details({
  super.key,
  required this.name,
  required this.user_doc,
  required this.service,
  required this.profile,
  required this.time_of_post,
  required this.address,
  required this.budget,
  required this.datee,
  required this.detail,
  required this.timee,
  required this.doc_uid,
  required this.uid,
  required this.doc,
  required this.oid
  });

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    return Scaffold(
       appBar: AppBar(
        title: TitleTune(heading: "$name", color: Colors.white, weight: FontWeight.bold, size: 21),
        backgroundColor: Color(0xff034047),
        leading: GestureDetector(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff034047),
                Color.fromARGB(255, 4, 81, 89),
              ]),
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 4, 81, 89),
                  offset: const Offset(0, 0),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pink,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Color.fromARGB(255, 13, 75, 125),
                          child: Image.network("${profile}",height: 35.h,width: 35.w,),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labels(heading: "Posted By", color: Color(0xff034047)),
                          SubHead(heading: "${name}", color: Colors.black)
                        ],
                      )
                      ],),
                    SDescription(description: "${time_of_post}")
                    ],
                  ),
                  SizedBox(height: 12.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pink,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Color.fromARGB(255, 13, 75, 125),
                          child: Icon(CupertinoIcons.location,color: Colors.white,),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labels(heading: "Location", color: Color(0xff034047)),
                          SubHead(heading: "${address}", color: Colors.black)
                        ],
                      )
                      ],),
                      SubHead(heading: "View on Map", color: Colors.green),
              
                    ],
                  ),
                  SizedBox(height: 10.h,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pink,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Color.fromARGB(255, 13, 75, 125),
                          child: Icon(CupertinoIcons.calendar,color: Colors.white,),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labels(heading: "Due Date", color: Color(0xff034047)),
                          SubHead(heading: "${datee}", color: Colors.black)
                        ],
                      )
                      ],),
                      Container()              
                    ],
                  ),
                  SizedBox(height: 10.h,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pink,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Color.fromARGB(255, 13, 75, 125),
                          child: Icon(CupertinoIcons.clock,color: Colors.white,),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labels(heading: "Time to reach", color: Color(0xff034047)),
                          SubHead(heading: "${timee}", color: Colors.black)
                        ],
                      )
                      ],),
                      Container()              
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Container(
                    height: 150.h,
                    width: double.infinity,
                    color: Color(0xffD7DBDE),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Title3(heading: "TASK BUDGET ESTIMATE", color: Colors.black),
                        BTitle2(heading: "RS ${budget}", color: Colors.green),
                        BTitle2(heading: "Awaiting Offer", color: Colors.black),
              
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  BTitle2(heading: "Task Detail", color: Color(0xff034047)),
                  SizedBox(height: 5.h,),
                  Container(
                    height: 100.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("$detail",),
                        fit: BoxFit.contain
                        )
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Container(
                                height: 40.h,
                                width: 130.w,
                                child: ElevatedButton(
                                  onPressed: ()async {
                                     await  FirebaseFirestore.instance.collection('notifications').add({
                                      "from":Provider11.uid,
                                      "to":uid,
                                      "status":"unread",
                                      "from_name":Provider11.fullname,
                                      "to_name":name,
                                      "time":DateTime.now().toString(),
                                      "title":"${Provider11.fullname} not accepted your request",
                                      "service":service,
                                      "profile":Provider11.profile
                                     });
                                    await  FirebaseFirestore.instance
                                    .collection('requestJobs').doc(doc).delete();
                                   await  FirebaseFirestore.instance
                                    .collection('users').doc(Provider11.uid).collection("your_requests")
                                    .doc(user_doc).update({
                                      'status':"rejected"
                                    });
                                     Navigator.of(context).pop();              
                                  },
                                  child: Row(children: [
                                    Icon(Icons.cancel,color: Colors.white,),
                                    SizedBox(width: 5.w,),
                                    Text("Reject Job")
                                  ]),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                  ),
                                )), 
                                 Container(
                                height: 40.h,
                                width: 130.w,
                                child: ElevatedButton(
                                  onPressed: () async{
                                     await  FirebaseFirestore.instance.collection('notifications').add({
                                      "from":Provider11.uid,
                                      "to":uid,
                                      "status":"unread",
                                      "from_name":Provider11.fullname,
                                      "to_name":name,
                                      "time":DateTime.now().toString(),
                                      "title":"${Provider11.fullname}  accepted your request",
                                      "service":service,
                                      "profile":Provider11.profile
                                     });
                                               final servicesWork = FirebaseFirestore.instance.collection("vendors").doc("${Provider11.uid}").collection("tasks");
      await servicesWork.add({
        "name":name,
        "jobTask":service,
        "date":datee,
        "time":timee,
        "address":address,
        "status":"inprogress",
        "img":"img",
        "uid":uid,
        "code":1,
        "profile":profile,
        "oid":oid,
        "amount":budget.toString(),
        "ongoing_uid":user_doc.toString()
      });  
      
                                  await  FirebaseFirestore.instance
                                    .collection('users').doc(uid).collection("your_requests")
                                    .doc(user_doc).update({
                                      'status':"accepted"
                                    });
                                    await  FirebaseFirestore.instance
                                    .collection('users').doc(uid).collection("orders_ongoing")
                                    .doc(user_doc).set({
        "name":name,
        "jobTask":service,
        "date":datee,
        "time":timee,
        "address":address,
        "status":"inprogress",
        "img":"img",
        "uid":uid,
        "code":1,
        "profile":profile,
        "oid":oid,
        "amount":budget.toString()
      });  
                                 await FirebaseFirestore.instance.collection('requestJobs').doc(doc).delete();
                                 
                                  },
                                  child: Row(children: [
                                    Icon(Icons.check_circle,color: Colors.white,),
                                    SizedBox(width: 5.w,),
                                    Text("Accept Job")
                                  ]),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                  ),
                                )),
                                
                    ],
                  ),
                  SizedBox(height: 10.h,),
            ],
          ),
        ),
      ) ,
    );
  }
}