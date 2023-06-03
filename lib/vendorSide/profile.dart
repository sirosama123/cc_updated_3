import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';

import '../provider/provider1.dart';
import 'editProfileVendor.dart';


class Profile1 extends StatelessWidget {
  const Profile1({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
             color: Color.fromARGB(255, 15, 118, 130),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundColor: Color.fromARGB(255, 150, 1, 115),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Color(0xff034047),
                    backgroundImage:NetworkImage(Provider11.profile.toString()),
                  ),
                ),
                SizedBox(height: 7.h,),
                Title1(heading: "${Provider11.fullname}", color: Colors.white)
              ],
             ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Padding(
                padding:  EdgeInsets.only(top: 5.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labels(heading: "Full Name", color: Colors.black),
                          
                          SizedBox(height: 5.h,),
                          TextField(
                            enabled: false, 
                            decoration: new InputDecoration(
                                hintText: '${Provider11.fullname}',
                                hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                suffixIcon: Icon(Icons.person,color: Color(0xff034047),)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labels(heading: "Email Address", color: Colors.black),
                          SizedBox(height: 5.h,),
                          TextField(
                            enabled: false, 
                            decoration: new InputDecoration(
                                hintText: '${Provider11.email}',
                                hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                suffixIcon: Icon(Icons.mail_outline,color: Color(0xff034047),)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labels(heading: "Mobile No", color: Colors.black),
                          SizedBox(height: 5.h,),
                          TextField(
                            enabled: false, 
                            decoration: new InputDecoration(
                                hintText: '${Provider11.phone}',
                                hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                suffixIcon: Icon(Icons.phone,color: Color(0xff034047),)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labels(heading: "Gender", color: Colors.black),
                          SizedBox(height: 5.h,),
                          TextField(
                            enabled: false, 
                            decoration: new InputDecoration(
                                hintText: '${Provider11.gender}',
                                hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                suffixIcon: Icon(Icons.male,color: Color(0xff034047),)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Container(
                              
                                height: 50,
                                width: double.infinity,
                                padding: EdgeInsets.fromLTRB(50,2,50,2),
                                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff034047),
                      shape: RoundedRectangleBorder(                       
                        borderRadius: BorderRadius.circular(20), // <-- Radius
                      ),
                    ),
                  child:  Title3(heading: "Edit", color: Colors.white),
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),);
                  },
                                )
                            ),       
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
