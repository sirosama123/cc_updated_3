import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/vendorSide/fixer_completed.dart';
import 'package:vendorapp/vendorSide/typeOfService.dart';
import 'package:vendorapp/vendorSide/verifyNumber.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/link.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';
import '../provider/provider1.dart';


class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
   final experience_years = TextEditingController();
   final experience_description = TextEditingController();
   final address = TextEditingController();
   final _formKey = GlobalKey<FormState>();
  @override
  FirebaseFirestore db = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    workExp(){
       db.collection("vendors").doc(Provider11.uid).update({
        "total_experience":experience_years.text,
        "experience_description":experience_description.text,
        "shop_address":address.text,
        "cv":""
       });
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffc6d8e2),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                
                children: [
                  SizedBox(height:20.h,),
                  Title1(heading: "Work Experience", color: Color(0xff034047)),
                  SizedBox(height:20.h,),
                  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Labels(heading: "Experience", color: Color(0xff034047)),
                              SizedBox(height: 5.h,),
                              Container(
                                height:35.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 20.w),
                                  child: TextFormField(
                                      validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Field is empty';
                              }
                              return null;
                            },
                                  controller:experience_years ,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                  // for below version 2 use this
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
                              // for version 2 and greater youcan also use this
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(2),
                      
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                      enabledBorder: null,
                                        focusedBorder: null,
                                    hintText: "in years",
                                  )
                              ),
                                )
                              ),
                            ],
                          ),
                 SizedBox(height: 20.h,),
                  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Labels(heading: "Experience Description", color: Color(0xff034047)),
                              SizedBox(height: 5.h,),
                              Container(
                                height:100.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 20.w),
                                  child: TextFormField(
                                      validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Field is empty';
                              }
                              return null;
                            },
                                  controller:experience_description ,
                                keyboardType: TextInputType.multiline,
                                  minLines: 1,//Normal textInputField will be displayed
                                  maxLines: 5,//keyboardType: TextInputType.multiline,
                      
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                      enabledBorder: null,
                                        focusedBorder: null,
                                    hintText: "Describe Your Experience...",
                                  )
                              ),
                                )
                              ),
                            ],
                          ),
                 SizedBox(height: 20.h,),
                  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Labels(heading: "Shop Address (if any)", color: Color(0xff034047)),
                              SizedBox(height: 5.h,),
                              Container(
                                height:35.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 20.w),
                                  child: TextFormField(
                                  controller:address ,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                      enabledBorder: null,
                                        focusedBorder: null,
                                    hintText: "Your Shop Address...",
                                  )
                              ),
                                )
                              ),
                            ],
                          ),
                SizedBox(height: 20.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Labels(heading: "Diploma/CV (if any)", color: Color(0xff034047)),
                SizedBox(height: 5.h,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Labels(heading: "Upload", color: Color(0xff034047)),
                      SizedBox(width: 10.w,),
                      Icon(Icons.upload_file,color:Color(0xff034047) ,)
                    ],
                  ),
                  width: double.infinity,
                  height: 40.h,
                   decoration: BoxDecoration(
                    
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
                )
                  ],
                ),
                SizedBox(height: 5.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Link(linkText: "no file uploaded"),
                  ],
                ),
                SizedBox(height: 20.h,),
                Container(
                  height: 48.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        workExp();
                         Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServicesGrid()),);
                      }
                     
                    },
                    child: Text("Next"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff034047)),
                    ),
                  )),
                ],
              ),
            ),
            
          ),
        ) ,
      ),
    );
  }
}