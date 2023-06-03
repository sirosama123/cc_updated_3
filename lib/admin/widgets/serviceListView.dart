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

import '../../widgets/labelsField.dart';
import '../../widgets/titleTune.dart';
import '../widgets/userListView.dart';


class ServiceListView extends StatelessWidget {
  const ServiceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                 );
  }
}