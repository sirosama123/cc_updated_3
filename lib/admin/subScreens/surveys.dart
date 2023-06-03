import 'package:cloud_firestore/cloud_firestore.dart';
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

import '../../widgets/smaillTitlebold.dart';
import '../../widgets/titleTune.dart';
import '../widgets/reviewScreen.dart';
import '../widgets/userListView.dart';


class Surveys extends StatefulWidget {
  Surveys({super.key});
  @override
    _SurveysState createState() => _SurveysState();
}

class _SurveysState extends State<Surveys> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('surveys').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: TitleTune(heading: "Surveys", color: Colors.white, weight: FontWeight.bold, size: 21),
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
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
          
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
          
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Column(
                          children: [
                            SizedBox(width: 5.h,),
                             Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
          
                      Title3(heading: "Survey", color: Color(0xff034047)),
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
                      // height:150.h,
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
                            Stitle(linkText: "Survey From"),
                            Stitle(linkText: data['servey_from']),
                          ],
                        ),
                        
                        SizedBox(height: 6.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stitle(linkText: "Survey uid"),
                            Stitle(linkText: data['provider_uid']),
                          ],
                        ),
                        
                        SizedBox(height: 6.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stitle(linkText: "Service Type"),
                            Stitle(linkText: data['servicetype']),
                          ],
                        ),
                        
                        SizedBox(height: 6.h,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stitle(linkText: "Issue"),
                            Stitle(linkText: data['issue']),
                          ],
                        ),
                        
                        SizedBox(height: 6.h,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stitle(linkText: "Shop Items Req"),
                            Stitle(linkText: data['shopItem']),
                          ],
                        ),
                        
                        SizedBox(height: 6.h,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stitle(linkText: "Order Id"),
                            Stitle(linkText: data['oid']),
                          ],
                        ),
                        
                        SizedBox(height: 6.h,),
                       
                      ],
                    )
                  ],
                )])))]);
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}