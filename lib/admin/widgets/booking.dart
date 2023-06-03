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

class BookingHist extends StatelessWidget {
    String?name;
  String?oid;
  String?slot;
  String?date;
  String?service;
  String?amount;
  String?status;
   BookingHist({super.key,required this.amount,required this.date,required this.name,required this.oid,required this.service,required this.slot,required this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
            children: [
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
                            subtitle: "$name",
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
                            subtitle: "$oid",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 15)
                      ],
                    ),
                  ), 
                ],
              ),
              SizedBox(height: 7.h,),
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
                            subtitle: "$slot",
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
                            subtitle: "$date",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 11)
                      ],
                    ),
                  ), 
                ],
              ),
              SizedBox(height: 7.h,),
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
                            subtitle: "$service",
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
                            subtitle: "$amount",
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 11)
                      ],
                    ),
                  ), 
                ],
              ),
              SizedBox(height: 7.h,),
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
                            subtitle: "cod",
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
                            subtitle: "$status",
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
