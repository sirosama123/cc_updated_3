import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

import '../provider/provider1.dart';


class RequestConfirmationBooking extends StatefulWidget {
  String service;
  RequestConfirmationBooking({super.key,required this.service});

  @override
  State<RequestConfirmationBooking> createState() => _RequestConfirmationBookingState();
}

class _RequestConfirmationBookingState extends State<RequestConfirmationBooking> {
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    String mode = "Cash on Payment";
    String? oid;
    generateOrderId() {
      var uuid = Uuid();
      oid = uuid.v1().substring(0, 10);
    }
    confirmOrder()async{
      CollectionReference jobs = FirebaseFirestore.instance.collection('jobs');
      CollectionReference posted_tasks = FirebaseFirestore.instance.collection('users').doc(Provider11.uid).collection("posted_tasks").doc().collection(Provider11.taskName.toString());
    await generateOrderId();
    await  jobs.add({
        "customer_name":Provider11.fullname,
        "phone":Provider11.phone,
        "service":Provider11.taskName,
        "date":Provider11.taskdate,
        "booking_charges":"700",
        "address":Provider11.address,
        "charges":Provider11.taskbudget,
        "total":int.parse(Provider11.taskbudget.toString())+700,
        "uid":Provider11.uid,
        "status":'order placed',
        "oid":oid.toString(),
      });
    await  posted_tasks.add({
        "customer_name":Provider11.fullname,
        "phone":Provider11.phone,
        "service":Provider11.taskName,
        "date":Provider11.taskdate,
        "booking_charges":"700",
        "address":Provider11.address,
        "charges":Provider11.taskbudget,
        "total":int.parse(Provider11.taskbudget.toString())+700,
        "status":'order placed',
        "oid":oid.toString(),
      });
      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OrderDetail(address: '', budget: '', date_post: '', service: '', time_post: '', oid: '',)),);
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
        body: Padding(
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
                            Labels(heading: Provider11.address.toString(), color: Color(0xff034047)),
                          ],
                        ),
                        SizedBox(height: 30.h,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Title3(heading: "Select Payment Mode", color: Colors.black),
                            SizedBox(height: 20.h,),
                           ToggleSwitch(
                              minWidth: double.infinity,
                              cornerRadius: 20.0,
                              activeBgColors: [[Color(0xff034047)], [Color(0xff034047)]],
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              initialLabelIndex: 1,
                              totalSwitches: 2,
                              labels: ['Cash on Delievery', 'Cash on Payment'],
                              radiusStyle: true,
                              onToggle: (index) {
                                print('switched to: $index');
                                setState(() {
                                  if (index==0) {
                                    mode = "Cash on Delievery";
                                  } else {
                                    mode = "Cash on Payment";
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h,),
                        Container(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              confirmOrder();
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
        ) ,
      ),
    );
  }
}