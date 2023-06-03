import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Link extends StatelessWidget {
  String? linkText;
  Link({super.key,required this.linkText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$linkText",
       style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 11.sp,
        color: Color.fromARGB(255, 1, 22, 39),
        decoration: TextDecoration.underline,
       ),
      ),
    );
  }
}