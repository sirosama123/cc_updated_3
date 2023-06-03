import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/screens/signin_fixer.dart';
import 'package:vendorapp/screens/testing.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:vendorapp/widgets/link.dart';

import '../vendorSide/createAccount.dart';
import 'login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
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
                    'assets/images/logo2.jpg'),
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
                            MaterialPageRoute(builder: (context) => FixerSignup()),);
                          },
                          child: Text("Sign up as user"),
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
                 Text("OR",style: TextStyle(color: Colors.black,fontSize: 20.sp),),
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
                            MaterialPageRoute(builder: (context) => CreateAccount()),);
                          },
                          child: Text("Sign up as fixxer"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff034047)),
                          ),
              )
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Description(description: "already have an account?"),
                GestureDetector(
                  onTap: (){
                     Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),);
                  },
                  child: Link(linkText: "login")),
              ],
            ),

          ],
        ),
      ),
    );
  }
}