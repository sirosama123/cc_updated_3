import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotLink extends StatelessWidget {
  String? link;
  Color? color;
   ForgotLink({super.key,required this.link,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$link",
      style:GoogleFonts.montserrat(
        textStyle: TextStyle(color: color, letterSpacing: .5,fontSize: 10.sp,fontWeight: FontWeight.w700,decoration: TextDecoration.underline,),
      ),
      
      textAlign: TextAlign.center,
    ) );
  }
}