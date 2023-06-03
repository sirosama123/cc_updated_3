import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/vendorSide/profile.dart';
import 'package:vendorapp/vendorSide/servicesList.dart';
import 'package:vendorapp/widgets/BTitle2.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:flutter/material.dart';
import 'package:vendorapp/widgets/mainHomeVendor.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'package:vendorapp/widgets/title4.dart';
import 'package:vendorapp/widgets/title5.dart';

import '../../provider/provider1.dart';
import '../../widgets/link.dart';
import '../../widgets/multiText.dart';
import 'endjobScreen.dart';
import 'jobLocation.dart';

class JobDetails2 extends StatelessWidget {
  String? status;
  String? jobType;
  String? serviceType;
  String? description;
  String? datee;
  String? time;
  String? amount;
  String? docId;
  String? user_uid;
  String? user_personal_uid;
  String? name;
  String? oid;
  String? user_profile;
  String? all_tasks_uid;
  String? pm;
  JobDetails2({super.key,required this.oid,required this.pm,required this.user_profile,required this.name,required this.amount,required this.user_personal_uid,required this.user_uid,required this.docId,required this.datee,required this.description,required this.jobType,required this.serviceType,required this.status,required this.time,required this.all_tasks_uid});

  @override
  Widget build(BuildContext context) {
    double user_amount;
    double vendor_amount;
     final Provider11 = Provider.of<Provider1>(context); 
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xff034047),
        title: Text("Job Details"),
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            Container(
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.4),
                border: Border.all(color: Colors.orange,width: 0.8)
              ),
              child: Padding(
                padding:EdgeInsets.all(8.0),
                child: Center(child: Multi(color: Colors.orange, subtitle: "$status", weight: FontWeight.bold, size: 25)),
              ),
            ),
            SizedBox(height: 15.h,),
            Container(
              height:100.h,
              width: double.infinity,
              color: Color.fromARGB(255, 200, 196, 196),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Multi(color: Colors.black, subtitle: 'Job Type', weight: FontWeight.bold, size: 10),
                        Multi(color: Colors.black, subtitle: '$jobType', weight: FontWeight.normal, size: 10),
                      ],
                    ),
                    Divider(color:Colors.black ,thickness: 1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Multi(color: Colors.black, subtitle: 'Job Type', weight: FontWeight.bold, size: 10),
                        Multi(color: Colors.black, subtitle: '$jobType', weight: FontWeight.normal, size: 10),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            Multi(color: Colors.black, subtitle: "Description", weight: FontWeight.bold, size: 14),
            SizedBox(height: 7.h,),
            Multi(color: Colors.black, subtitle: "description of the job should be shown here", weight: FontWeight.normal, size: 10),
            // GestureDetector(
            //   onTap: (){
            //         Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => JobLocation()),);
            //   },
            //   child: Link(linkText: "Check Job Location")),
            SizedBox(height: 7.h,),
            Container(
              height: 50.h,
              width: double.infinity,
              color: Color.fromARGB(255, 211, 208, 208),
              child: Padding(
                padding:EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month,color: Colors.amber,),
                        SizedBox(width: 2.w,),
                        Multi(color: Colors.black, subtitle: "$datee", weight: FontWeight.bold, size: 11)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.timelapse,color: Colors.amber,),
                        SizedBox(width: 2.w,),
                        Multi(color: Colors.black, subtitle: "$time", weight: FontWeight.bold, size: 11)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 7.h,),
            Container(
              height: 50.h,
              width: double.infinity,
              color: Colors.grey,
              child: Padding(
                padding:EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Multi(color: Colors.black, subtitle: "Service Amount", weight: FontWeight.bold, size: 11),
                    Multi(color: Colors.black, subtitle: "\$ $amount", weight: FontWeight.bold, size: 11)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Container(

                            height: 48.h,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async{
                                if(pm=='credit'){
                                  final ref = FirebaseDatabase.instance.ref();
final snapshot = await ref.child('appers/$user_personal_uid/amount').get();
final snapshot2 = await ref.child('vendors/${Provider11.uid}/amount').get();
if (snapshot.exists) {
    user_amount=double.parse(snapshot.value.toString());
    vendor_amount= double.parse(snapshot2.value.toString());
     await FirebaseFirestore.instance.collection("users").doc(user_personal_uid).collection("orders_completed").doc(user_uid).set({
                                  "service":serviceType,
                                  "date":datee,
                                  "time":time,
                                  "status":'completed',
                                  "completed_by":Provider11.fullname,
                                  "uid_vendor":Provider11.uid,
                                  "amount":amount
                              });
                               await FirebaseFirestore.instance.collection("vendors").doc(Provider11.uid).collection("orders_completed").doc(user_uid).set({
                                  "service":serviceType,
                                  "date":datee,
                                  "time":time,
                                  "status":'completed',
                                  "completed_by":Provider11.fullname,
                                  "uid_vendor":Provider11.uid,
                                  "amount":amount,
                                  "order_of":user_personal_uid,
                                  "name":name
                              });
                                await FirebaseFirestore.instance.collection("posted_jobs_data").doc(all_tasks_uid).update({
                                  "status":'completed',
                                 
                              });
                              await  FirebaseFirestore.instance.collection("vendors").doc(Provider11.uid).collection("tasks").doc(docId).delete();
                              await  FirebaseFirestore.instance.collection("users").doc(user_personal_uid).collection("orders_ongoing").doc(user_uid).delete();
                               await  FirebaseFirestore.instance.collection('notifications').add({
                                      "from":Provider11.fullname,
                                      "to":name,
                                      "status":"unread",
                                      "vendor_uid":Provider11.uid,
                                      "user_uid":user_personal_uid,
                                      "time":DateTime.now().toString(),
                                      "title":"${Provider11.fullname}  Completed your task of order Id $oid",
                                      "service":serviceType,
                                     });
                             await ref.child('users/$user_personal_uid').update({
                                "amount":"${(user_amount-double.parse(amount.toString())).toString()}"
                             });
                             await ref.child('vendors/${Provider11.uid}').update({
                                "amount":"${(vendor_amount+double.parse(amount.toString())).toString()}"
                             });
                          
} else {
    print('No data available.');
}
                             
                              
                             
                                  // Navigator.push(
                                  // context,
                                  // MaterialPageRoute(builder: (context) => Terms()),);
                                
                                
                                }else{
                                  print(all_tasks_uid);
                                  final ref = FirebaseDatabase.instance.ref();

 await FirebaseFirestore.instance.collection("users").doc(user_personal_uid).collection("orders_completed").doc(user_uid).set({
                                  "service":serviceType,
                                  "date":datee,
                                  "time":time,
                                  "status":'completed',
                                  "completed_by":Provider11.fullname,
                                  "uid_vendor":Provider11.uid,
                                  "amount":amount
                              });
                               await FirebaseFirestore.instance.collection("vendors").doc(Provider11.uid).collection("orders_completed").doc(user_uid).set({
                                  "service":serviceType,
                                  "date":datee,
                                  "time":time,
                                  "status":'completed',
                                  "completed_by":Provider11.fullname,
                                  "uid_vendor":Provider11.uid,
                                  "amount":amount,
                                  "order_of":user_personal_uid,
                                  "name":name
                              });
                                await FirebaseFirestore.instance.collection("posted_jobs_data").doc(all_tasks_uid).update({
                                  "status":'completed',
                                 
                              });
                              await  FirebaseFirestore.instance.collection("vendors").doc(Provider11.uid).collection("tasks").doc(docId).delete();
                              await  FirebaseFirestore.instance.collection("users").doc(user_personal_uid).collection("orders_ongoing").doc(user_uid).delete();
                               await  FirebaseFirestore.instance.collection('notifications').add({
                                      "from":Provider11.fullname,
                                      "to":name,
                                      "status":"unread",
                                      "from_name":Provider11.fullname,
                                      "to_name":name,
                                      "time":DateTime.now().toString(),
                                      "title":"${Provider11.fullname}  Completed your task of order Id $oid",
                                      "service":serviceType,
                                      "profile":Provider11.profile
                                     });
                            
                           
                     
                                 showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Listen"),
                  content: const Text("This job was COD you can collect money from customer"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay",style: TextStyle(
                          
                        ),),
                      ),
                    ),
                  ],
                ),
              );

                                
                                
                                }
                              },
                              child: Text("End Job"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Color(0xff034047)),
                              ),
                            )),
            //  SizedBox(height: 20.h,),
            // Container(
            //                 height: 48.h,
            //                 width: double.infinity,
            //                 child: ElevatedButton(
            //                   onPressed: () {
                              
            //                       // Navigator.push(
            //                       // context,
            //                       // MaterialPageRoute(builder: (context) => Terms()),);
                                
                                
            //                   },
            //                   child: Text("Reject Job"),
            //                   style: ButtonStyle(
            //                     backgroundColor:
            //                         MaterialStateProperty.all(Color(0xff034047)),
            //                   ),
            //                 ))
          ],
        ),
      ),
    );
  }
}
