import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/screens/login.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/testing.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/smaillTitlebold.dart';

class Policy extends StatelessWidget {
   Policy({super.key});
  List terms = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum dapibus sodales purus, fermentum efficitur leo molestie eget.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum dapibus sodales purus, fermentum efficitur leo molestie eget.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum dapibus sodales purus, fermentum efficitur leo molestie eget.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum dapibus sodales purus, fermentum efficitur leo molestie eget.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum dapibus sodales purus, fermentum efficitur leo molestie eget.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum dapibus sodales purus, fermentum efficitur leo molestie eget."
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(  
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
                Row(
                  children: [
                    
                     Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/logo2.jpg'),
                            fit: BoxFit.fill,
                        ),
                          )
                    ),
                    SizedBox(width: 15.w,),
                    Heading2(heading: "Policy",color:Color(0xff034047) ,),
                 
                  ],
                ),
              Container(
                height: 400.h.h,
                child: ListView.builder(

scrollDirection: Axis.vertical,
                  //  physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:10,
                   itemBuilder: (context,index){
                     return  Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 20.h,vertical: 5.w),
                       child: Text(   "- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum dapibus sodales purus, fermentum efficitur leo molestie eget.",
                textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w500),
                ),
                     );
                   }),
              ),
              SizedBox(height: 20.h,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Container(
                          height: 48.h,
                          width:150.w,
                           decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                
                              ),
                          child: ElevatedButton(
                            onPressed: () {
                               Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainHome(pics: [],)),);
                            },
                            child: Text("Decline",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff034047)),
                            ),
                )
              ),
               Container(
                          height: 48.h,
                          width:150.w,
                           decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                
                              ),
                          child: ElevatedButton(
                            onPressed: () {
                               Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),);
                            },
                            child: Text("Accept",style: TextStyle(color: Color(0xff034047),fontWeight: FontWeight.w500),),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                )
              ),
                    ],
                  )
          ]),
        ),
      ),
    );
  }
}