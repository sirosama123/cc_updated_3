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


class TabsAdmin extends StatelessWidget {
  String? img1;
  String? tabName;
  TabsAdmin({super.key,required this.img1,required this.tabName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 155.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(1, 1),color: Colors.black,spreadRadius: 1,blurRadius: 15)
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5.h,),
          Container(
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("$img1"))
            ),
          ),
          SizedBox(height: 5.h,),
          Title4(heading: "$tabName", color: Color(0xff034047), weight: FontWeight.bold),
          SizedBox(height: 5.h,),
        ],
      ),
    );
  }
}