import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/orderDetail.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/link.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title2.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../mainCredit/credit.dart';
import '../provider/provider1.dart';
import '../showingMap.dart';


class ConfirmationBooking extends StatefulWidget {
  String service;
  ConfirmationBooking({super.key,required this.service});

  @override
  State<ConfirmationBooking> createState() => _ConfirmationBookingState();
}

class _ConfirmationBookingState extends State<ConfirmationBooking> {
  @override
  bool status = false;
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 







    String mode = "Cash on Payment";
    String? oid;
    generateOrderId() {
      var uuid = Uuid();
      oid = uuid.v1().substring(0, 10);
    }
   
   abc()async{
       CollectionReference jobs = FirebaseFirestore.instance.collection('jobs');
      CollectionReference posted_jobs_data = FirebaseFirestore.instance.collection('posted_jobs_data');
      CollectionReference posted_tasks = FirebaseFirestore.instance.collection('users').doc(Provider11.uid).collection("posted_tasks");
    await generateOrderId();


        DocumentReference posted_jobs_1= await posted_jobs_data.add({
        "customer_name":Provider11.fullname,
        "phone":Provider11.phone,
        "service":Provider11.taskName,
        "date":Provider11.taskdate,
        "booking_charges":"700",
        "address":Provider11.taskwhere,
        "charges":Provider11.taskbudget,
        "total":int.parse(Provider11.taskbudget.toString())+700,
        "uid":Provider11.uid,
        "status":'order placed',
        "oid":oid.toString(),
        "detail":Provider11.taskdetail,
        "time":'${DateTime.now().hour + DateTime.now().minute}',
               "date_of_posting":"${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
        "time_of_posting":"${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
        "payment_method":Provider11.pm,
        "profile":Provider11.profile
        
      });
    posted_jobs_1;

    DocumentReference posted_task_user_side= await  posted_tasks.add({
        "customer_name":Provider11.fullname,
        "phone":Provider11.phone,
        "service":Provider11.taskName,
        "date":Provider11.taskdate,
        "booking_charges":"700",
        "address":Provider11.taskwhere,
        "charges":Provider11.taskbudget,
        "total":int.parse(Provider11.taskbudget.toString())+700,
        "status":'order placed',
        "oid":oid.toString(),
        "detail":Provider11.taskdetail,
        "posted_tasks_all":posted_jobs_1.id,
        "date_of_posting":"${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
        "time_of_posting":"${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}"
     ,"payment_method":Provider11.pm,
     "profile":Provider11.profile
      });
    posted_task_user_side;
     DocumentReference posted_task_= await jobs.add({
        "customer_name":Provider11.fullname,
        "phone":Provider11.phone,
        "service":Provider11.taskName,
        "date":Provider11.taskdate,
        "booking_charges":"700",
        "address":Provider11.taskwhere,
        "charges":Provider11.taskbudget,
        "total":int.parse(Provider11.taskbudget.toString())+700,
        "uid":Provider11.uid,
        "status":'order placed',
        "oid":oid.toString(),
        "detail":Provider11.taskdetail,
        "time":'${DateTime.now().hour + DateTime.now().minute}',
        "request_uid":posted_task_user_side.id,
        "posted_tasks_all":posted_jobs_1.id,
                "date_of_posting":"${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
        "time_of_posting":"${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}"
    ,"payment_method":Provider11.pm,
    "profile":Provider11.profile
      });
    posted_task_;

  
    final requests = FirebaseFirestore.instance.collection('users').doc(Provider11.uid).collection("vendors_request").doc(posted_task_user_side.id);
    await requests.set({
      "data":"data",
      "job_uid":posted_task_.id
    });
   
      showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  content:Text("Your Request Has been Submitted"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay"),
                      ),
                    ),
                  ],
                ),
              );
               setState(() {
        status=false;
      });
   }


  does(double paisy)async{
     if (paisy>double.parse(Provider11.taskbudget.toString())) {
      abc();
    } 
    else {
       showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  content:Text("You have less amount Please Recharge your account"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MySample()),);
                      },
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(14),
                        child: const Text("update money"),
                      ),
                    ),
                  ],
                ),
              );
       setState(() {
        status=false;
      });
    }
    
  }
    confirmOrder()async{
      setState(() {
        status=true;
      });
      double? paisy ;
          DatabaseReference starCountRef =
       await FirebaseDatabase.instance.ref('appers/${Provider11.uid}/amount');
await starCountRef.onValue.listen((DatabaseEvent event) {
    final data = event.snapshot.value;
    paisy = double.parse(data.toString());
    does(paisy!);
});

   
    
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ), 
          backgroundColor: Color(0xff034047),
          title: Text("Booking Confirmation"),
        ),
        body: Stack(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
              child: Container(
                child: Column(
                  children: [
                    Title3(heading: "Customer Information:", color: Colors.black),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.w),
                      child: Container(
                        child: Column(
                          children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(CupertinoIcons.person,color:Color(0xff034047) ,),
                                  SizedBox(width: 4.w,),
                                  Labels(heading: "Customer Name ", color: Color(0xff034047)),
                                ],
                              ),
                              Labels(heading: Provider11.fullname.toString(), color: Color(0xff034047)),
                            ],
                             ),
                            SizedBox(height: 10.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.phone,color:Color(0xff034047) ,),
                                    SizedBox(width: 4.w,),
                                    Labels(heading: "Phone Number ", color: Color(0xff034047)),
                                  ],
                                ),
                                Labels(heading: Provider11.phone.toString(), color: Color(0xff034047)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    Title3(heading: "Service Details:", color: Colors.black),
                    SizedBox(height: 20.h,),
                     Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.w),
                      child: Container(
                        child: Column(
                          children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(CupertinoIcons.briefcase,color:Color(0xff034047) ,),
                                  SizedBox(width: 4.w,),
                                  Labels(heading: "Service Name ", color: Color(0xff034047)),
                                ],
                              ),
                              Labels(heading: Provider11.taskName.toString(), color: Color(0xff034047)),
                            ],
                             ),
                            SizedBox(height: 10.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.calendar,color:Color(0xff034047) ,),
                                    SizedBox(width: 4.w,),
                                    Labels(heading: "Date", color: Color(0xff034047)),
                                  ],
                                ),
                                Labels(heading: Provider11.taskdate.toString(), color: Color(0xff034047)),
                              ],
                            ),
                             SizedBox(height: 10.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.clock,color:Color(0xff034047) ,),
                                    SizedBox(width: 4.w,),
                                    Labels(heading: "Time", color: Color(0xff034047)),
                                  ],
                                ),
                                Labels(heading: "12:00PM - 02:00PM", color: Color(0xff034047)),
                              ],
                            ),
                             SizedBox(height: 10.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.money_dollar,color:Color(0xff034047) ,),
                                    SizedBox(width: 4.w,),
                                    Labels(heading: "Booking Charges", color: Color(0xff034047)),
                                  ],
                                ),
                                Labels(heading: Provider11.taskbudget.toString(), color: Color(0xff034047)),
                              ],
                            ),
                             SizedBox(height: 10.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.home,color:Color(0xff034047) ,),
                                    SizedBox(width: 4.w,),
                                    Labels(heading: "Address", color: Color(0xff034047)),
                                  ],
                                ),
                                Labels(heading: Provider11.taskwhere.toString(), color: Color(0xff034047)),
                              ],
                            ),
                             SizedBox(height: 10.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.card_membership_outlined,color:Color(0xff034047) ,),
                                    SizedBox(width: 4.w,),
                                    Labels(heading: "Payment Method", color: Color(0xff034047)),
                                  ],
                                ),
                                Labels(heading: Provider11.pm.toString(), color: Color(0xff034047)),
                              ],
                            ),
                           
                            SizedBox(height: 30.h,),
                            Container(
                              height: 48.h,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                               
                                  Provider11.pm=='cod'?abc():confirmOrder();
                                },
                                child: Text("Done"),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Color(0xff034047)),
                                ),
                    )
                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
              status==false?Container(): Align(
              alignment: Alignment.center,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Color(0xff034047).withOpacity(0.6),
                child: Center(
                  child: Container(
                    height: 120.h,
                    width: 120.w,
                     decoration: BoxDecoration(
                      color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(color: Color(0xff034047),width: 2)
                          ),
                    child: Stack(
                      children: [
                        
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                          height: 70.h,
                          width: 70.w,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(15.r),
                          //   border: Border.all(color: Colors.white,width: 2)
                          // ),
                          child:Image.asset('assets/images/logopng.png',height: 20.h,width: 20.w,)
                        ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 90.h,
                            width: 90.w,
                            child: CircularProgressIndicator(
                              
                              color: Color(0xff034047),),
                          )),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ) ,
      ),
    );
  }
}