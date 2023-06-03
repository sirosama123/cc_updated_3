import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/widgets/multiText.dart';
import 'package:vendorapp/widgets/subhead.dart';


class MyJobRect extends StatelessWidget {
  String? name;
  String? jobtype;
  String? servicetype;
  String? status;
  String? profile;
  MyJobRect({super.key,required this.jobtype,required this.name,required this.servicetype,required this.status,required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber,width: 0.5),
        color: Colors.white,

      ),
      child: Padding(
        padding:EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Colors.blue,
                        backgroundImage: NetworkImage("${profile}"),
                      ),
                      SizedBox(height: 4.h,),
                      Multi(color: Color(0xff034047), subtitle: "${name}", weight: FontWeight.bold, size: 12)
                    ],
                  ),
                  Container(
                    height: 70.h,
                    width: 1.5.w,
                    color:Color.fromARGB(255, 86, 82, 82) ,
                  )
                ],
              )
              ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Multi(color: Color(0xff034047), subtitle: "Job Type", weight: FontWeight.bold, size: 12),
                  Multi(color: Color(0xff034047), subtitle: "Service Type", weight: FontWeight.bold, size: 12),
                  Multi(color: Color(0xff034047), subtitle: "Status", weight: FontWeight.bold, size: 12)
                ],
              )
              ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Multi(color: Color.fromARGB(255, 86, 82, 82), subtitle: "${servicetype}", weight: FontWeight.normal, size: 12),
                  Multi(color: Color.fromARGB(255, 86, 82, 82), subtitle: "${servicetype}", weight: FontWeight.normal, size: 12),
                  Multi(color: Color.fromARGB(255, 86, 82, 82), subtitle: "${status}", weight: FontWeight.normal, size: 12)
                ],
              )
              ),
          ],
        ),
      ),
    );
  }
}