   import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
import '../widgets/userListView.dart';


class ReviewScreen extends StatefulWidget {
  String? uid;
  ReviewScreen({super.key,required this.uid});
  @override
    _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
 
  @override
  Widget build(BuildContext context) {
     final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('vendors').doc(widget.uid).collection("reviews").snapshots();

    return Scaffold(
      appBar: AppBar(
        title: TitleTune(heading: "Reviews", color: Colors.white, weight: FontWeight.bold, size: 21),
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
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
    
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
    
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Column(
                      children: [
                        SizedBox(width: 5.h,),
                         Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  Title3(heading: "Review", color: Color(0xff034047)),
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
                        Stitle(linkText: data['from']),
                        Stitle(linkText: "2 days ago"),
                      ],
                    ),
                    
                    SizedBox(height: 3.h,),
                    Description(description: data['review'].toString()),
                    SizedBox(height: 3.h,),
                    RatingBar.builder(
                      itemSize: 15,
                      ignoreGestures: true,
             initialRating: double.parse(data['rating'].toString()),
             minRating: 1,
             direction: Axis.horizontal,
             allowHalfRating: true,
             itemCount: 5,
             itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
             itemBuilder: (context, _) => Icon(
               Icons.star,
               color: Colors.amber,
             ),
             onRatingUpdate: (rating) {
               print(rating);
             },
          )
                  ],
                )
              ],
            )])))]);
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}