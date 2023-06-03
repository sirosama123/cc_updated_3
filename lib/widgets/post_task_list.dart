import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/screens/request_list.dart';
import 'package:vendorapp/widgets/smallDesc.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';

class PostList extends StatelessWidget {
  String status;
  String topic;
  String time;
  PostList({super.key,required this.status ,required this.time,required this.topic});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      height:60.h ,
      width: double.infinity,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubHead(heading: topic, color: Colors.black),
                SDescription(description: time)
              ],
            ),
          ),
          Container(
                          height: 20.h,
                          width: 80,
                          decoration: BoxDecoration(
                            color:status=="pending"? Colors.orange:status=="accepted"?Color.fromARGB(255, 0, 247, 222):status=="completed"?Colors.green:Colors.red,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 3.h),
                            child:status=="pending"? Text(  
                              "pending",
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ): Text(  
                              "blocked",
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
        
        ],
      ) ,
    );
  }
}