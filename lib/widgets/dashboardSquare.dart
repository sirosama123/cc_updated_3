import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:vendorapp/widgets/title5.dart';


class SquareDB extends StatelessWidget {
  String? heading;
  String? value;
  SquareDB({super.key,required this.heading,required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 70.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15.r)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Title5(heading: "$heading", color: Colors.black, weight: FontWeight.w600),
          SizedBox(height: 10.h,),
          Heading2(heading: "$value", color: Colors.black)
        ],
      ),
    );
  }
}