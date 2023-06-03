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

import '../../provider/provider1.dart';



class BookingConfirmationScreen extends StatelessWidget {
  String? name;
  String? jobtask;
  String? date;
  String? time;
  String? address;
  String? status;
  String? img;
  String? uid;
  String? jobUid;
  int? code;
  BookingConfirmationScreen({
    super.key,
    required this.name,
    required this.jobtask,
    required this.date,
    required this.time,
    required this.address,
    required this.status,
    required this.img,
    required this.uid,
    required this.jobUid,
    required this.code
    });

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    markAsCompleted()async{
 

  //    QuickAlert.show(
  //     onConfirmBtnTap: ()async{
      //        DocumentReference servicesWork = FirebaseFirestore.instance.collection("vendors").doc("${Provider11.uid}").collection("tasks").doc();
      // await servicesWork.set({
      //   "name":name,
      //   "jobTask":jobtask,
      //   "date":date,
      //   "time":time,
      //   "address":address,
      //   "status":"inprogress",
      //   "img":img,
      //   "uid":uid,
      //   "code":1
      // });
  //     await FirebaseFirestore.instance.collection("jobs").doc("${jobUid}").delete();
      
  //     },
  //     onCancelBtnTap: (){
        
  //     },
  //  context: context,
  //  type: QuickAlertType.confirm,
  //  text: 'Do you want to Accept Job',
  //  confirmBtnText: 'Yes',
  //  cancelBtnText: 'No',
  //  confirmBtnColor: Colors.green,
  // );
    }
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
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                    radius: 35.r,
                    backgroundColor: Color(0xff034047),
                    child:CircleAvatar(
                      radius: 33.r,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage("$img"),
                    ) ,
                  ),
                  SizedBox(width: 5.w,),
                  TitleTune(heading: "$name", color: Colors.black, weight: FontWeight.bold, size: 16),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone,color: Color(0xff034047),),
                      SizedBox(width: 20.w,),
                      Icon(Icons.message,color: Color(0xff034047),)
                    ],
                  )
                ],
              ),
               Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                    radius: 35.r,
                    backgroundColor: Colors.transparent,
                    
                  ),
                  SizedBox(width: 5.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTune(heading: "Job Task", color: Colors.black, weight: FontWeight.normal, size: 12),
                      TitleTune(heading: "$jobtask", color: Colors.black, weight: FontWeight.bold, size: 16),
                    ],
                  ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                    radius: 35.r,
                    backgroundColor: Colors.transparent,
                    
                  ),
                  SizedBox(width: 5.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTune(heading: "Date", color: Colors.black, weight: FontWeight.normal, size: 12),
                      TitleTune(heading: "$date", color: Colors.black, weight: FontWeight.bold, size: 16),
                    ],
                  ),
                  SizedBox(width: 30.w,),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTune(heading: "Time", color: Colors.black, weight: FontWeight.normal, size: 12),
                      TitleTune(heading: "$time", color: Colors.black, weight: FontWeight.bold, size: 16),
                    ],
                  ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                    radius: 35.r,
                    backgroundColor: Colors.transparent,
                    
                  ),
                  SizedBox(width: 5.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTune(heading: "Address", color: Colors.black, weight: FontWeight.normal, size: 12),
                      Row(
                        children: [
                          Container(
                            width: 200.w,
                            child: TitleTune(heading: "$address", color: Colors.black, weight: FontWeight.bold, size: 14)),
                        CircleAvatar(
                          radius: 20.r,
                          backgroundColor: Color(0xff034047),
                          child: Icon(CupertinoIcons.location),
                        )
                        ],
                      ),
                    ],
                  ),
                 
                    ],
                  ),
                ],
              ),
              
              Stepper1(activeStatus: code,),
                   Container(
                            height: 40.h,
                            width: 230.w,
                            child: ElevatedButton(
                              onPressed: () {
                               markAsCompleted();
                                
                                 
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Icon(Icons.check_circle,color: Colors.white,),
                                SizedBox(width: 5.w,),
                                Text("Mark As Completed")
                              ]),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                              ),
                            )),
              SizedBox(height: 10.h,),
            ],
          ),
        ),
      ),
    );
  }
}