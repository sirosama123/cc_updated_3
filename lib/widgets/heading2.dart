import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Heading2 extends StatelessWidget {
  final String heading;
  Color color;
   Heading2({Key? key,required this.heading,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        heading,
        style:GoogleFonts.lato(
          fontSize: 20.sp,
          color: color,
          fontWeight: FontWeight.w500,
        )
        //  TextStyle(
        //   fontSize: 18.sp,
        //   fontWeight: FontWeight.w600,
        //   color: Color(0xff034047)
        // ),
      ),
    );
  }
}