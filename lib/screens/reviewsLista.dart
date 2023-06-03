   import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/provider_description.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/profile2.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/title2.dart';
import 'package:vendorapp/widgets/title3.dart';

import '../widgets/smaillTitlebold.dart';
import '../widgets/titleTune.dart';
  
 
 class ReviewLists extends StatelessWidget {
  const ReviewLists({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: TitleTune(heading: "Reviews", color: Colors.white, weight: FontWeight.bold, size: 21),
        backgroundColor: Color(0xff034047),
        leading: GestureDetector(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff034047),
                Color.fromARGB(255, 4, 81, 89),
              ]),
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 4, 81, 89),
                  offset: const Offset(0, 0),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                     Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Title3(heading: "Reviews Month1", color: Color(0xff034047)),
              SizedBox(width: 5.w,),
              Icon(Icons.reviews,color: Color(0xff034047),)
            ],),
            SizedBox(height: 10.h,),
              Container(
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
      height:150.h,
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        child:Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stitle(linkText: "Abdul Sami"),
                    Stitle(linkText: "2 days ago"),
                  ],
                ),
                
                SizedBox(height: 3.h,),
                Description(description: "works very neatly")
              ],
            )
          ],
        ),
        SizedBox(height: 8.h,),
         Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stitle(linkText: "sharjeel ur rehman"),
                    Stitle(linkText: "5 days ago"),
                  ],
                ),
                SizedBox(height: 3.h,),
                Description(description: "works very neatly")
              ],
            )
          ],
        ),
        SizedBox(height: 8.h,),
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stitle(linkText: "Abdul haseeb"),
                    Stitle(linkText: "8 days ago"),
                  ],
                ),
                
                SizedBox(height: 3.h,),
                Description(description: "works very neatly")
              ],
            )
          ],
        ),
          ],
        )
      ),
      ),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
               Container(
                child: Column(
                  children: [
                     Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Title3(heading: "Reviews Month2", color: Color(0xff034047)),
              SizedBox(width: 5.w,),
              Icon(Icons.reviews,color: Color(0xff034047),)
            ],),
            SizedBox(height: 10.h,),
              Container(
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
      height:150.h,
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        child:Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stitle(linkText: "Abdul Sami"),
                    Stitle(linkText: "2 days ago"),
                  ],
                ),
                
                SizedBox(height: 3.h,),
                Description(description: "works very neatly")
              ],
            )
          ],
        ),
        SizedBox(height: 8.h,),
         Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stitle(linkText: "sharjeel ur rehman"),
                    Stitle(linkText: "5 days ago"),
                  ],
                ),
                SizedBox(height: 3.h,),
                Description(description: "works very neatly")
              ],
            )
          ],
        ),
        SizedBox(height: 8.h,),
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stitle(linkText: "Abdul haseeb"),
                    Stitle(linkText: "8 days ago"),
                  ],
                ),
                
                SizedBox(height: 3.h,),
                Description(description: "works very neatly")
              ],
            )
          ],
        ),
          ],
        )
      ),
      ),
                  ],
                ),
              ),
               SizedBox(height: 20.h,),
               Container(
                child: Column(
                  children: [
                     Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Title3(heading: "Reviews Month3", color: Color(0xff034047)),
              SizedBox(width: 5.w,),
              Icon(Icons.reviews,color: Color(0xff034047),)
            ],),
            SizedBox(height: 10.h,),
              Container(
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
      height:150.h,
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        child:Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stitle(linkText: "Abdul Sami"),
                    Stitle(linkText: "2 days ago"),
                  ],
                ),
                
                SizedBox(height: 3.h,),
                Description(description: "works very neatly")
              ],
            )
          ],
        ),
        SizedBox(height: 8.h,),
         Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stitle(linkText: "sharjeel ur rehman"),
                    Stitle(linkText: "5 days ago"),
                  ],
                ),
                SizedBox(height: 3.h,),
                Description(description: "works very neatly")
              ],
            )
          ],
        ),
        SizedBox(height: 8.h,),
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stitle(linkText: "Abdul haseeb"),
                    Stitle(linkText: "8 days ago"),
                  ],
                ),
                
                SizedBox(height: 3.h,),
                Description(description: "works very neatly")
              ],
            )
          ],
        ),
          ],
        )
      ),
      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
 
 
 