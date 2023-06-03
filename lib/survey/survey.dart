import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/confirmation_booking.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/post_detail.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/link.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/title2.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'dart:async';
import 'dart:io';

import '../../provider/provider1.dart';
import '../../widgets/post_task_list.dart';
import '../../widgets/titleTune.dart';


class SurveyScreenForm extends StatefulWidget {
   SurveyScreenForm({super.key});

  @override
  State<SurveyScreenForm> createState() => _SurveyScreenFormState();
}

class _SurveyScreenFormState extends State<SurveyScreenForm> {
    TextEditingController serviceType = TextEditingController();

      TextEditingController issue = TextEditingController();

      TextEditingController shopItem = TextEditingController();

      TextEditingController lorem1 = TextEditingController();

      TextEditingController lorem2 = TextEditingController();

  @override
    final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
      
    
    final Provider11 = Provider.of<Provider1>(context);
    return Scaffold(
      appBar: AppBar(
          title: TitleTune(heading: "Survey", color: Colors.white, weight: FontWeight.bold, size: 21),
          
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
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: 10.w),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logo3.png",height: 120.h,width: 120.w,),
                    SizedBox(height: 10.h,),
                    Container(
                                    padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.r),
                                        border: Border.all(color: Colors.black)),
                                    child: TextFormField(
                                      controller: serviceType,
                                      decoration: InputDecoration(
                                          focusColor: Color(0xff164584),
                                          border: InputBorder.none,
                                          labelText: "Service Type",
                                          
                                          labelStyle: TextStyle(color: Colors.black)),
                                            validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Field is empty';
                                      }
                                      return null;
                                    },
                                    ),
                                  ),
                                  SizedBox(height:8.h,),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.r),
                                        border: Border.all(color: Colors.black)),
                                    child: TextFormField(
                                      controller: issue,
                                      decoration: InputDecoration(
                                          focusColor: Color(0xff164584),
                                          border: InputBorder.none,
                                          labelText: "Issue Identified",
                                          
                                          labelStyle: TextStyle(color: Colors.black)),
                                            validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Field is empty';
                                      }
                                      return null;
                                    },
                                    ),
                                  ),
                                  SizedBox(height:8.h,),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.r),
                                        border: Border.all(color: Colors.black)),
                                    child: TextFormField(
                                      controller: shopItem,
                                      decoration: InputDecoration(
                                          focusColor: Color(0xff164584),
                                          border: InputBorder.none,
                                          labelText: "shop item required (if any)",
                                          
                                          labelStyle: TextStyle(color: Colors.black)),
                                        
                                    ),
                                  ),
                                  SizedBox(height:8.h,),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.r),
                                        border: Border.all(color: Colors.black)),
                                    child: TextFormField(
                                      controller: lorem1,
                                      decoration: InputDecoration(
                                          focusColor: Color(0xff164584),
                                          border: InputBorder.none,
                                          labelText: "Order Id",
                                          
                                          labelStyle: TextStyle(color: Colors.black)),
                                            validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Field is empty';
                                      }
                                      return null;
                                    },
                                    ),
                                  ),
                                  SizedBox(height:8.h,),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.r),
                                        border: Border.all(color: Colors.black)),
                                    child: TextFormField(
                                      controller: lorem2,
                                      decoration: InputDecoration(
                                          focusColor: Color(0xff164584),
                                          border: InputBorder.none,
                                          labelText: "User Name",
                                          
                                          labelStyle: TextStyle(color: Colors.black)),
                                            validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Field is empty';
                                      }
                                      return null;
                                    },
                                    ),
                                  ),
                                  SizedBox(height:8.h,),
                                  Container(
                              height: 48.h,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: ()async {
                                 if(_formKey.currentState!.validate()){
                                 await FirebaseFirestore.instance.collection('surveys').add({
                                    "servicetype":serviceType.text,
                                    "issue":issue.text,
                                    "shopItem":shopItem.text,
                                    "oid":lorem1.text,
                                    "user_name":lorem2.text,
                                    "servey_from":Provider11.fullname,
                                    "provider_uid":Provider11.uid
                                  });
                                    showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  content:Text("Your Survey Has been Submitted"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay"),
                      ),
                    ),
                  ],
                ),
              );
                                  serviceType.clear();
                                  issue.clear();
                                  shopItem.clear();
                                  lorem1.clear();
                                  lorem2.clear();
                                  Navigator.of(context).pop();
                                  // Navigator.push(
                                  // context,
                                  // MaterialPageRoute(builder: (context) => ServiceSelection()),);
                                 }
                                },
                                child: Text("Send Survey"),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Color(0xff034047)),
                                ),
                    )
                  ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}