import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:vendorapp/widgets/title5.dart';


class SquareDB2 extends StatelessWidget {
  String? heading;
  String? value;
  Color? color; 
  SquareDB2({super.key,required this.heading,required this.value,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: color,
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