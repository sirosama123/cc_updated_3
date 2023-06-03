import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:countup/countup.dart';


class smallDBcounts extends StatelessWidget {
  double head;
   smallDBcounts({super.key,required this.head});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Countup(
  begin: 0,
  end:head ,
  duration: Duration(seconds: 3),
  separator: ',',
   style: GoogleFonts.montserrat(
        textStyle: TextStyle(color:Colors.white , letterSpacing: .5,fontSize: 40.sp,fontWeight: FontWeight.w600) ),
)
      
      
    );
  }
}