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
import 'package:vendorapp/widgets/multi3.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/titleTune.dart';

import '../provider/provider1.dart';
import '../widgets/BTitle2.dart';
import '../widgets/smallDesc.dart';
import '../widgets/title3.dart';


class Notifications extends StatelessWidget {
  Notifications({super.key});
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    final stream1 = FirebaseFirestore.instance.collection('notifications').snapshots();
    return Scaffold(
      backgroundColor: Colors.white,
          body: StreamBuilder<QuerySnapshot>(
        stream: stream1,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
    
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
    
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: Colors.white,
                child: ListView(
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return  Padding(
                      padding:  EdgeInsets.only(bottom:0.h,top: 0.h),
                      child: Container(
                        child: data['to']==Provider11.uid?GestureDetector(
                          onTap: (){
                          FirebaseFirestore.instance.collection('notifications').doc("${document.id}").update({
                        "status":"read"
                      });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 80.h,
                                decoration: BoxDecoration(
                                  color: data['status']=='unread'?Color(0xff034047).withOpacity(0.7):Colors.white,
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.black,
                                  //     offset: Offset(1, 1),
                                  //     spreadRadius: 10,
                                  //     blurRadius: 1
                                  //   ),
                                  // ],
                                  borderRadius: BorderRadius.circular(10.r)
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: CircleAvatar(
                                        radius: 30.r,
                                        backgroundImage: NetworkImage(data['profile'].toString()),
                                      )
                                      ),
                                    Expanded(
                                      flex: 5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Multi3(
                                            color:data['status']=='unread'?Colors.white:Colors.black, 
                                            subtitle: "notificataion from ${data['from_name']}", 
                                            weight: data['status']=='unread'?FontWeight.bold:FontWeight.normal, 
                                            size: 16
                                            ),
                                          SizedBox(height: 2.h,),
                                          Multi3(
                                            color: data['status']=='unread'?Colors.white:Colors.black, 
                                            subtitle: "${data['title']}", 
                                            weight: data['status']=='unread'?FontWeight.bold:FontWeight.normal, 
                                            size: 13
                                            ),
                                        ],
                                      )
                                      ),
                                      Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Multi3(
                                            color: data['status']=='unread'?Colors.white:Colors.black, 
                                            subtitle: "", 
                                            weight: data['status']=='unread'?FontWeight.bold:FontWeight.normal, 
                                            size: 12
                                            ),
                                          SizedBox(height: 4.h,),
                                          Multi3(
                                            color: data['status']=='unread'?Colors.white:Colors.black, 
                                            subtitle: "", 
                                            weight: data['status']=='unread'?FontWeight.bold:FontWeight.normal, 
                                            size: 12
                                            ),
                                        ],
                                      )
                                      ),
                                  
                                  ],
                                ),
                              ),
                              Divider(color:Color(0xff034047),thickness: 1,)
                            ],
                          )):Container()),
                    );
                  }).toList(),
                ),
            
            ),
          );
        },
      ),
    );
  }
}