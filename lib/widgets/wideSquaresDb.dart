import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title4.dart';
import 'package:vendorapp/widgets/title5.dart';
import 'package:vendorapp/widgets/titleTune.dart';


class wideSquareDB extends StatelessWidget {
  String? heading;
  Icon icon;
  String? value;
  wideSquareDB({super.key,required this.heading,required this.icon,required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 50.h,
      width: 150.w,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20.r)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(width: 1.w,),
              SubHead(heading: "$value", color: Colors.black)
            ],
          ),
          TitleTune(heading: "$heading", color: Colors.black, weight: FontWeight.w600, size: 13,),
        ],
      ),
    );
  }
}


class wideSquareDB1 extends StatelessWidget {
  String? heading;
  wideSquareDB1({super.key,required this.heading,});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 50.h,
      width: 150.w,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20.r)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          TitleTune(heading: "$heading", color: Colors.black, weight: FontWeight.w600, size: 13,),
        ],
      ),
    );
  }
}