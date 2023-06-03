import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/BTitle2.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/heading2.dart';

import 'package:flutter/material.dart';
import 'package:vendorapp/widgets/mainHomeVendor.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'package:vendorapp/widgets/title4.dart';
import 'package:vendorapp/widgets/title5.dart';

import '../../widgets/smaillTitlebold.dart';


class UserListView extends StatelessWidget {
  String img;
  String name;
  String status;
  UserListView({super.key,required this.img,required this.name,required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(1, 1),color: Colors.black,spreadRadius: 1,blurRadius: 15)
        ]
      ),
      child: Padding(
        padding:EdgeInsets.symmetric(horizontal: 7.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
              width: 50.w,
              child: CircleAvatar(
                radius: 35.r,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage("$img",),
              ),
            ),
            SizedBox(width: 6.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Title3(heading: "$name", color: Color(0xff034047), ),
                Stitle(linkText: "$status"),
              ],
            )
              ],
            ),
            Icon(Icons.arrow_forward_ios,color:Color(0xff034047) ,size: 30.sp,)
          ],
        ),
      )
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     SizedBox(height: 5.h,),
      //     Container(
      //       height: 80.h,
      //       width: 80.w,
      //       decoration: BoxDecoration(
      //         image: DecorationImage(image: AssetImage("$img1"))
      //       ),
      //     ),
      //     SizedBox(height: 5.h,),
      //     Title4(heading: "$tabName", color: Color(0xff034047), weight: FontWeight.bold),
      //     SizedBox(height: 5.h,),
      //   ],
      // ),
    );
  }
}