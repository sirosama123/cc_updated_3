import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/screens/terms.dart';
import 'package:vendorapp/screens/testing.dart';
import 'package:vendorapp/vendorSide/numberAdd.dart';
import 'package:vendorapp/vendorSide/serviceSelection.dart';
import 'package:vendorapp/widgets/callout.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/title4.dart';

import '../provider/provider1.dart';



class Selection1 extends StatelessWidget {
  String img;
  String title;
  int index;
  Selection1(
    {super.key,
    required this.img,
    required this.title,
    required this.index
    });

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    return Container(
      height: 210.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            color: Colors.black,
            blurRadius: 10,
            spreadRadius: 2
          )
        ]
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "$img"
                      ),
                      fit: BoxFit.cover
                      )
                  ),
                ),
              )
              ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Title4(heading: "$title", color: Colors.black, weight: FontWeight.bold),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          Provider11.works.add(index);
                          print(Provider11.works);
                        }, 
                        child: Text("data")),
                       ElevatedButton(
                        onPressed:null,
                        child: Text("data")),
                    ],
                  ),
                ],
              )
              ),
          ],
        ),
        ),
    );
  }
}