import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
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

import '../../widgets/multi5.dart';
import '../../widgets/titleTune.dart';


class BookingDetail extends StatelessWidget {
  String?name;
  String?oid;
  String?slot;
  String?date;
  String?service;
  String?amount;
  String?status;
  BookingDetail({super.key,required this.amount,required this.date,required this.name,required this.oid,required this.service,required this.slot,required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: TitleTune(heading: "Booking Details", color: Colors.white, weight: FontWeight.bold, size: 21),
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
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(1, 1),
                  color: Colors.black,
                  spreadRadius: 1,
                  blurRadius: 15)
            ]),
        child: Padding(
          padding:EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundColor: Color(0xff034047),
                child: CircleAvatar(
                  radius:45.r ,
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 12.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTune(
                            heading: "Name",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "Abdul Sami",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 18)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTune(
                            heading: "OrderId",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "97951vy15",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 15)
                      ],
                    ),
                  ), 
                ],
              ),
              SizedBox(height: 12.h,),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTune(
                            heading: "Slot",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "16:00-18:00",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 11)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTune(
                            heading: "Date",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "10-6-23",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 11)
                      ],
                    ),
                  ), 
                ],
              ),
              SizedBox(height: 12.h,),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTune(
                            heading: "Service",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "Cleaning",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 11)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTune(
                            heading: "Amount",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "3000",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 11)
                      ],
                    ),
                  ), 
                ],
              ),
              SizedBox(height: 12.h,),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTune(
                            heading: "Payment mode",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "16:00-18:00",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 11)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTune(
                            heading: "Status",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "Confirmed",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 11)
                      ],
                    ),
                  ), 
                ],
              ),
              SizedBox(height: 12.h,),
              Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTune(
                            heading: "Email",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "Confirmed@bs.com",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 11)
                      ],
                    ),
              SizedBox(height: 12.h,),
              Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTune(
                            heading: "Address",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "Confirmed@bs.com",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 11)
                      ],
                    ),
              SizedBox(height: 12.h,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTune(
                            heading: "City",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "16:00-18:00",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 11)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTune(
                            heading: "Country",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "Confirmed",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 11)
                      ],
                    ),
                  ), 
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}