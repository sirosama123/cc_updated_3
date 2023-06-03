import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Callout extends StatelessWidget {
  final String heading;
  Color color;
   Callout({Key? key,required this.heading,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        heading,
        style:GoogleFonts.lato(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: color,
        )
      ),
    );
  }
}