import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tap_to_expand/tap_to_expand.dart';
import 'package:vendorapp/admin/subScreens/updatebanners/updateBanner.dart';
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
import 'package:vendorapp/widgets/slider.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/title2.dart';
import 'package:vendorapp/widgets/title3.dart';

import '../../widgets/title4.dart';
import '../../widgets/titleTune.dart';
import '../widgets/serviceListView.dart';
import 'dart:async';
import 'dart:io';



class BannersAdmin extends StatelessWidget {
  List<String>? userimgs;
  List<String>? vendorimgs;
   BannersAdmin({super.key,required this.userimgs,required this.vendorimgs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleTune(heading: "Banners", color: Colors.white, weight: FontWeight.bold, size: 21),
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
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleTune(heading: "User app Banners", color: Color(0xff034047), weight: FontWeight.bold, size: 14),
                  Container(
                                        height: 30.h,
                                        width: 80.w,
                                        child: ElevatedButton(
                                          onPressed: ()async {
                                             
                                        
                                             await Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => BannersUpdate(app: 'userapp',)),
                                    );
                                            
                                          },
                                          child: Text("Update"),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(Color(0xff034047)),
                                          ),
                                        )),
              ],
            ),
            SizedBox(height: 10.h,),
            Slider23(imgs: userimgs!.toList()),
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleTune(heading: "Vendor app Banners", color: Color(0xff034047), weight: FontWeight.bold, size: 14),
                  Container(
                                        height: 30.h,
                                        width: 80.w,
                                        child: ElevatedButton(
                                          onPressed: ()async {
                                             
                                        
                                    
                                             await Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => BannersUpdate(app: 'vendorapp',)),
                                    );
                                            
                                          },
                                          child: Text("Update"),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(Color(0xff034047)),
                                          ),
                                        )),
              ],
            ),
            SizedBox(height: 10.h,),
            Slider23(imgs: vendorimgs!.toList())
          ],
        ),
      ),
    );
  }
}