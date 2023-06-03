import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/boarding_screen/presentation/onBoarding.dart';
import 'package:vendorapp/screens/postList.dart';
import 'package:vendorapp/widgets/post_task_list.dart';
import 'package:vendorapp/widgets/smallDesc.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../widgets/BTitle2.dart';
import '../widgets/labelsField.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          OnBoarding()
                                                         )
                                       )
         );
  }
  @override

  Widget build(BuildContext context) {
   return Stack(
      children: [
        Image.asset("assets/images/electrician.jpg",fit: BoxFit.cover,height: double.infinity,),
        Scaffold(
        
          backgroundColor: Colors.black.withOpacity(0.7),
          body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200.h,
                width: 200.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/logo3.png'),
                      fit: BoxFit.fill,
                  ),
                    )
              ),
            ),
           
          ],
          ),
        ) ,
        )
      ],
    );
  }
}