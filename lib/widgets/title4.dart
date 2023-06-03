import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Title4 extends StatelessWidget {
  final String heading;
  Color color;
  FontWeight weight;
   Title4({Key? key,required this.heading,required this.color,required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        heading,
        style:GoogleFonts.lato(
          fontWeight: weight,
          fontSize: 16.sp,
          color: color,
        )
      ),
    );
  }
}