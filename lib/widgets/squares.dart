import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/widgets/subhead.dart';

class Square extends StatelessWidget {
  Color color1;
  Color color2;
  String sub;
  String address;
  String? nature;

   Square({super.key,required this.color1,required this.color2,required this.sub,required this.address,required this.nature});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 100.w,
      decoration: BoxDecoration(   
        borderRadius: BorderRadius.circular(10.0),           
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: color1,
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 0.0),
                  // Shadow position
                ),
              ],
            ),
    child: Padding(
      padding:  EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
        nature!="network"?Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
             image: new DecorationImage(
              image: new AssetImage(address),
              fit: BoxFit.fill,
          )
            ),
          ): Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
             image: new DecorationImage(
              image: new NetworkImage(address),
              fit: BoxFit.fill,
          )
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: SubHead(heading: sub, color: color2),
          ),
        ],
      )
    ),
    );
  }
}