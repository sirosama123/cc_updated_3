import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:vendorapp/widgets/link.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title4.dart';
import 'package:vendorapp/widgets/title5.dart';

class Jobs extends StatelessWidget {
  String value;
  String? name;
  String? id;
  String? date;
  String? address;
  Jobs({super.key,
  required this.value,
  required this.date,required this.id,required this.name,
  required this.address
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        height: 120.h,
        width: double.infinity,
        decoration: BoxDecoration(   
          borderRadius: BorderRadius.circular(10.0),           
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff034047),
                    blurRadius: 6.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 0.0),
                    // Shadow position
                  ),
                ],
              ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 7.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Colors.pink,
                    child: CircleAvatar(
                          radius: 27.r,
                          child:
                              Image.asset("assets/images/user.png",height: 35.h,width: 35.w,),
                          backgroundColor: Colors.blue,
                        ),
                  ),
                  Column(
                    children: [
                      Title4(heading: "$name", color: Color(0xff034047), weight: FontWeight.w600,),
                      Title5(heading: "$address", color: Color(0xff034047), weight: FontWeight.w600)
                    ],
                  ),
                  Heading2(heading: "\$$value", color: Colors.amber)
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month,color: Color(0xff034047),size: 20.sp,),
                      SizedBox(width: 3.w,),
                      Title4(heading: "${date.toString().length>11?date.toString().substring(0,11):date}", color: Color(0xff034047), weight: FontWeight.w500)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.timelapse,color: Color(0xff034047),size:20.sp,),
                      SizedBox(width: 3.w,),
                      Title4(heading: "17:00-18:00", color: Color(0xff034047), weight: FontWeight.w500)
                    ],
                  ),
                  Link(linkText: "Accept")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}