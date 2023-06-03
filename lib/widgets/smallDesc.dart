import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SDescription extends StatelessWidget {
  final String description;
  const SDescription({Key? key,required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xff6F6F6F)
        ),
      ),
    );
  }
}