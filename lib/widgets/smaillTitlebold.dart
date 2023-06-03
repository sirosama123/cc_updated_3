import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Stitle extends StatelessWidget {
  String? linkText;
  Stitle({super.key,required this.linkText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$linkText",
       style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12.sp,
        color: Color.fromARGB(255, 1, 22, 39),
        decoration: TextDecoration.underline,
       ),
       textAlign: TextAlign.start,
      ),
    );
  }
}