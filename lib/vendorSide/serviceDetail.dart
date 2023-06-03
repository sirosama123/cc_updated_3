import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/widgets/dashboardSquare.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:vendorapp/widgets/jobs.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/title4.dart';
import 'package:vendorapp/widgets/title5.dart';
import 'package:vendorapp/widgets/wideSquaresDb.dart';
import '../provider/provider1.dart';
import '../widgets/labelsField.dart';
import '../widgets/title3.dart';
import 'addService/category.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ServiceDetail extends StatefulWidget {
  String price;
  String serviceN;
  String img;
  String description;
  String availability;
  String cat;
  ServiceDetail({super.key,required this.price,required this.serviceN,required this.img,required this.description,required this.availability,required this.cat});

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  bool? status ;
  initState() {
    widget.availability=='available'? setState(() {
                status = true;
              }): setState(() {
                status = false;
              });
  super.initState();
 // Add listeners to this class
}
final _formKey = GlobalKey<FormState>();
  @override
  
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    return Scaffold(
       appBar: AppBar(
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
      body: Container(
        child: Padding(
                        padding:EdgeInsets.all(8.0),
                        child: Container(
                           decoration: BoxDecoration(
                              color: Color.fromARGB(255, 205, 203, 203),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                      
                                      
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
                                                        Icon(CupertinoIcons.money_dollar,color:Color(0xff034047) ,),
                                                        SizedBox(width: 4.w,),
                                                        Labels(heading: "Price", color: Color(0xff034047)),
                                                      ],
                                                    ),
                                            Row(
                                            children: [
                                              Title4(heading: "Rs ", color: Colors.black, weight: FontWeight.bold,),
                                              Title4(heading: "${widget.price}", color: Colors.black, weight: FontWeight.bold,),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h,),
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
                                                  Labels(heading: "${widget.serviceN}", color: Color(0xff034047)),
                                                ],
                                                 ),
                      
                                        SizedBox(height: 10.h,),        
                                               
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
                              '${widget.img}'),
                          fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                                      )
                                                  ],
                                                ),
                                              
                                ],
                                ),),
                          
                                ),
                                SizedBox(height: 10.h,),
                                 Title5(heading: "${widget.description}", color: Color(0xff034047), weight: FontWeight.w500,),
                                  SizedBox(height: 10.h,),
                                               Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Labels(heading: "Availability", color: Color(0xff034047)),
                                                  Column(
                                                    children: [
                                                      Labels(heading: "${widget.availability}", color: Color(0xff034047)),
                                                      SizedBox(height: 5.h,),
                                                       Center(
        child: Container(
          child: FlutterSwitch(
            width: 50.w,
            height: 20.h,
            valueFontSize: 9.sp,
            toggleSize: 20.0,
            value: status!,
            borderRadius: 30.0,
            padding: 1.0,
            showOnOff: true,
            onToggle: (val) {
            
              final individual = FirebaseFirestore.instance.collection('${widget.serviceN}').doc(Provider11.uid);
              setState(() {
                status = val;
              });
              if (status==true) {
                 FirebaseFirestore.instance
    .collection('works').doc(Provider11.uid).collection("sub")
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            if(doc['name']==widget.serviceN){
              FirebaseFirestore.instance
    .collection('works').doc(Provider11.uid).collection("sub").doc(doc.id).update({
      "availability":"available"
    });
            }
        });
    });
    individual.update({
      "availability":"available"
    });
                setState(() {
                widget.availability="available";

              });

                
              } else {
                  FirebaseFirestore.instance
    .collection('works').doc(Provider11.uid).collection("sub")
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            if(doc['name']==widget.serviceN){
              FirebaseFirestore.instance
    .collection('works').doc(Provider11.uid).collection("sub").doc(doc.id).update({
      "availability":"unavailable"
    });
            }
        });
    });
    individual.update({
      "availability":"unavailable"
    });
                setState(() {
                
                widget.availability="unavailable";
                
              });
              }
            },
          ),
        ),
      ),
                                                    ],
                                                  ),
                                                ],
                                                 ),
                                   SizedBox(height: 10.h,),
                                              
                                               
                                ]),
                            ),
                          ),
                        ),
                      )
      ),
    );
  }
}