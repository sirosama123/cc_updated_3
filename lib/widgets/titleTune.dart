import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleTune extends StatelessWidget {
  final String heading;
  Color color;
  FontWeight weight;
  double size;
   TitleTune({Key? key,required this.heading,required this.color,required this.weight,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        heading,
        style:GoogleFonts.lato(
          fontWeight: weight,
          fontSize: size.sp,
          color: color,
        ),
        textAlign:TextAlign.start
      ),
      
    );
  }
}