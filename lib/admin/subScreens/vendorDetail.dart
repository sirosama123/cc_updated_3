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


class VendorDetail extends StatelessWidget {
  String? name;
  String? age;
  String? uid;
  String? dob;
  String? services;
  String? address;
  String? cnic;
  String? email;
  String? gender;
  String? phone;
  String? experience;
  String? profile;
  VendorDetail({super.key,required this.address,required this.profile,required this.age,required this.cnic,required this.dob,required this.email,required this.experience,required this.gender,required this.name,required this.phone,required this.services,required this.uid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: TitleTune(heading: "Vendor Details", color: Colors.white, weight: FontWeight.bold, size: 21),
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
                  backgroundImage: NetworkImage("$profile"),
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
                            heading: "Age",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "$age",
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
                            heading: "uid",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "$uid",
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
                            heading: "Dob",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "$dob",
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
                            heading: "Services",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "$services",
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
                            heading: "amount",
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
                            heading: "address",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "$address",
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
                            heading: "Cnic",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "$cnic",
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
                            subtitle: "$email",
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
                            heading: "Gender",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "$gender",
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
                            heading: "phone",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "$phone",
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
                            heading: "experience",
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 10),
                        SizedBox(
                          height: 3.h,
                        ),
                        Multi5(
                            subtitle: "$experience",
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