import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/admin/widgets/smallDBcounts.dart';
import 'package:vendorapp/admin/widgets/smallDbmain.dart';

class smallDBsquare extends StatelessWidget {
   String? mainhead;
   double counts;
   Color bgColor;
   double height;
   double width;

   smallDBsquare({super.key,required this.mainhead,required this.counts,required this.bgColor,required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(       
        borderRadius: BorderRadius.circular(5.r),           
        color: bgColor,    
      ),
      child:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 4.h,vertical: 2.w),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              smallDBmain(head: "${mainhead}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  smallDBcounts(head: counts),
                  Icon(Icons.arrow_forward,size:20.sp ,color: Colors.white)
                ],
              )
            ],
          ),
      ),
      );
  }
}