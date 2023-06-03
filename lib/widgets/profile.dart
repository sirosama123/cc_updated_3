import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title3.dart';


class Profile extends StatelessWidget {
  String name;
  String? profile;
  String? uid;
  double rating;
  Profile({super.key,required this.name,required this.profile,required this.rating,required this.uid});
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Color(0xff034047),width: 1.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(-1, -1),
            color: Color(0xff034047),
            blurRadius: 5,
            spreadRadius: 3
          )
        ]
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage("$profile"),
                backgroundColor: Colors.blue,
              ),
              SizedBox(width: 10.w,),
              Column(
                children: [
                  Title3(heading: name, color: Colors.black),
                ],
              )
              ],
            ),

            Padding(
              padding:  EdgeInsets.only(left: 0.w),
              child: RatingBar.builder(
                ignoreGestures: true,
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}