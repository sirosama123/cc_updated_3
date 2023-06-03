import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/smallDesc.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';

class RequestTask extends StatelessWidget {
  String status;
  String topic;

  String id;
  RequestTask({super.key,required this.status ,required this.topic,required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
       
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color:Color(0xff034047) ,
                    blurRadius: 6.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 0.0),
                    // Shadow position
                  ),
                ],
        ),
        height:status=='approved'?100.h:80.h ,
        width: double.infinity,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Labels(heading: "OrderId", color: Colors.black),
                  SubHead(heading: id, color: Colors.black),
                  
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Labels(heading: "Service", color: Colors.black),
                  SubHead(heading: topic, color: Colors.black),
                  
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                                  height: 20.h,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color:status=="approved"? Colors.green:Colors.red,
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(vertical: 3.h),
                                    child:status=="approved"? Text(  
                                      "approved",
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ): Text(  
                                      "rejected",
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                    status=='approved'?Container(
                            height: 30.h,
                            width: 100.w,
                            child: ElevatedButton(
                              onPressed: () {
                              },
                              child: Text("Book Now"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Color(0xff034047)),
                              ),
                            )):Container()
                ],
              ),
            ),
          ],
        ) ,
      ),
    );
  }
}