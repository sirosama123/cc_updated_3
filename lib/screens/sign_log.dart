import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/screens/login.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/screens/signin_fixer.dart';
import 'package:vendorapp/screens/testing.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/link.dart';
import 'package:vendorapp/widgets/smallDesc.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';

import '../widgets/heading2.dart';

class sign_log extends StatelessWidget {
  const sign_log({super.key});

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
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/logo3.png'),
                    fit: BoxFit.fill,
                ),
                  )
            ),
            SizedBox(height: 20.h,),
            
            
            Container(
                        height: 48.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),);
                          },
                          child: Text("Log in"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff034047)),
                          ),
              )
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Container(
                  height: 2.h,
                  width: 70.w,
                  color: Color(0xffc6d8e2),
                 ),
                 Text("OR",style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                 Container(
                  height: 2.h,
                  width: 70.w,
                  color: Color(0xffc6d8e2),
                 ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
                        height: 48.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),);
                          },
                          child: Text("Sign in"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff034047)),
                          ),
              )
            ),
          ],
          ),
        ) ,
        )
      ],
    );
   
  }
}

