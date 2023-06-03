import 'package:another_stepper/another_stepper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:vendorapp/vendorSide/stepper1.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/titleTune.dart';

import '../provider/provider1.dart';
import '../showingMap.dart';
import 'bookings/bookingConfirmationScreen.dart';


class CustomerServiceProfile extends StatelessWidget {
  String? name;
  String? jobtask;
  String? date;
  String? time;
  String? address;
  String? status;
  String? img;
  String? uid;
  String? jobUid;
  String? reqUid;
  String? amount;
  String? oid;
  String? all_tasks_uid;
  String? pm;
  CustomerServiceProfile({
    super.key,
    required this.name,
    required this.all_tasks_uid,
    required this.jobtask,
    required this.date,
    required this.time,
    required this.address,
    required this.status,
    required this.img,
    required this.uid,
    required this.jobUid,
    required this.reqUid,
    required this.amount,
    required this.oid
    ,required this.pm
    });

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    LatLng? loc;
    Future<LatLng> _getLatLngFromAddress(String address) async {
      List<Location> locations = await locationFromAddress(address);
      Location location = locations.first;
      loc = LatLng(location.latitude, location.longitude);
       Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowOnMap(loc: loc!, address: address, name: name, city: address,)));
      return LatLng(location.latitude, location.longitude);
  }

    requestJob()async{
 

     QuickAlert.show(
      context: context,
      onConfirmBtnTap: ()async{
      final servicesWork = FirebaseFirestore.instance.collection("users").doc("${uid}").collection("vendors_request").doc("${reqUid}").collection("data");
      await servicesWork.add({
        "name":Provider11.fullname,
        "profile":Provider11.profile,
        "jobTask":jobtask,
        "date":date,
        "time":time,
        "address":address,
        "status":"request",
        "img":img,
        "vendor_uid":Provider11.uid,
        "code":0,
        "amount":amount,
        "oid":oid,
        "all_task_uid":all_tasks_uid,
         "payment_method":pm
      });

      final servicesWork_vendor = FirebaseFirestore.instance.collection("vendors").doc("${Provider11.uid}").collection("sent_proposals").doc("${reqUid}");
      servicesWork_vendor.set({
        "name":name,
        "jobTask":jobtask,
        "date":date,
        "time":time,
        "address":address,
        "status":"request",
        "img":img,
        "uid":uid,
        "code":0,
        "amount":amount,
        "oid":oid,
"all_task_uid":all_tasks_uid,
"payment_method":pm
      });
       await  FirebaseFirestore.instance.collection('notifications').add({
                                      "from":Provider11.uid,
                                      "to":uid,
                                      "status":"unread",
                                      "from_name":Provider11.fullname,
                                      "to_name":name,
                                      "time":DateTime.now().toString(),
                                      "title":"${Provider11.fullname} sends request on your job",
                                      "service":jobtask,
                                      "profile":Provider11.profile
                                     });
      Navigator.of(context).pop();

      // await FirebaseFirestore.instance.collection("jobs").doc("${jobUid}").delete();
      //  Navigator.push(context,MaterialPageRoute(builder: (context) => BookingConfirmationScreen(
      //   name: name, 
      //   jobtask: jobtask, 
      //   date: date, 
      //   time: time, 
      //   address: address, 
      //   status: status, 
      //   img: img, 
      //   uid: uid, 
      //   jobUid: jobUid, 
      //   code: 1)),);
      },
      onCancelBtnTap: (){
        
      },
   
   type: QuickAlertType.confirm,
   text: 'Do you want to apply for this Job?',
   confirmBtnText: 'Yes',
   cancelBtnText: 'No',
   confirmBtnColor: Colors.green,
  );
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
                        GestureDetector(
                          onTap: (){
_getLatLngFromAddress(address!);
                          },
                          child: CircleAvatar(
                            radius: 20.r,
                            backgroundColor: Color(0xff034047),
                            child: Icon(CupertinoIcons.location),
                          ),
                        )
                        ],
                      ),
                    ],
                  ),
                 
                    ],
                  ),
                ],
              ),
              
              Stepper1(activeStatus: 0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Container(
                            height: 40.h,
                            width: 130.w,
                            child: ElevatedButton(
                              onPressed: () {
                                 Navigator.of(context).pop();              
                              },
                              child: Row(children: [
                                Icon(Icons.cancel,color: Colors.white,),
                                SizedBox(width: 5.w,),
                                Text("Cancel")
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
                              onPressed: () {
                               requestJob();  
                              },
                              child: Row(children: [
                                Icon(Icons.check_circle,color: Colors.white,),
                                SizedBox(width: 5.w,),
                                Text("Apply Job")
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
      ),
    );
  }
}