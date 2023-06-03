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
  
  
  class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Container(
          
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                   decoration: BoxDecoration(
                      color: Color.fromARGB(255, 205, 203, 203),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                           Title3(heading: "Service no.1:", color: Colors.black),
                                SizedBox(height: 20.h,),
                                 Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Container(
                                    child: Column(
                                      children: [
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(CupertinoIcons.briefcase,color:Color(0xff034047) ,),
                                              SizedBox(width: 4.w,),
                                              Labels(heading: "Service Name ", color: Color(0xff034047)),
                                            ],
                                          ),
                                          Labels(heading: "Cleaning", color: Color(0xff034047)),
                                        ],
                                         ),
                                       
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(CupertinoIcons.camera,color:Color(0xff034047) ,),
                                                SizedBox(width: 4.w,),
                                                Labels(heading: "Image", color: Color(0xff034047)),
                                              ],
                                            ),
                                            Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                      'assets/images/deep.png'),
                  fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                              )
                                          ],
                                        ),
                                      
                        ],
                        ),)
                        )]),
                    ),
                  ),
                ),

                SizedBox(height: 20.h,),
                 Container(
                   decoration: BoxDecoration(
                      color: Color.fromARGB(255, 205, 203, 203),
                      borderRadius: BorderRadius.circular(15.r)),
                   child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                           Title3(heading: "Service no.2:", color: Colors.black),
                                SizedBox(height: 20.h,),
                                 Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Container(
                                    child: Column(
                                      children: [
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(CupertinoIcons.briefcase,color:Color(0xff034047) ,),
                                              SizedBox(width: 4.w,),
                                              Labels(heading: "Service Name ", color: Color(0xff034047)),
                                            ],
                                          ),
                                          Labels(heading: "Painting", color: Color(0xff034047)),
                                        ],
                                         ),
                                       
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(CupertinoIcons.camera,color:Color(0xff034047) ,),
                                                SizedBox(width: 4.w,),
                                                Labels(heading: "Image", color: Color(0xff034047)),
                                              ],
                                            ),
                                            Container(
                                 height: 40.0,
                                 width: 40.0,
                                 decoration: BoxDecoration(
                    image: DecorationImage(
                                 image: AssetImage(
                      'assets/images/painting.png'),
                                 fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                                 ),
                               )
                                          ],
                                        ),
                                      
                        ],
                        ),)
                        )]),
                    ),
                                 ),
                 ),
                SizedBox(height: 20.h,),
                 Container(
                   decoration: BoxDecoration(
                      color: Color.fromARGB(255, 205, 203, 203),
                      borderRadius: BorderRadius.circular(15.r)),
                   child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                           Title3(heading: "Service no.3:", color: Colors.black),
                                SizedBox(height: 20.h,),
                                 Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Container(
                                    child: Column(
                                      children: [
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(CupertinoIcons.briefcase,color:Color(0xff034047) ,),
                                              SizedBox(width: 4.w,),
                                              Labels(heading: "Service Name ", color: Color(0xff034047)),
                                            ],
                                          ),
                                          Labels(heading: "Kitchen", color: Color(0xff034047)),
                                        ],
                                         ),
                                       
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(CupertinoIcons.camera,color:Color(0xff034047) ,),
                                                SizedBox(width: 4.w,),
                                                Labels(heading: "Image", color: Color(0xff034047)),
                                              ],
                                            ),
                                            Container(
                                 height: 40.0,
                                 width: 40.0,
                                 decoration: BoxDecoration(
                    image: DecorationImage(
                                 image: AssetImage(
                      'assets/images/kitchen.png'),
                                 fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                                 ),
                               )
                                          ],
                                        ),
                                      
                        ],
                        ),)
                        )]),
                    ),
                                 ),
                 ),
              ],
            ),
          ),
        )),
    );
  }
}