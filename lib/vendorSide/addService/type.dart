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
import 'package:vendorapp/vendorSide/addService/remainingAttr.dart';
import 'package:vendorapp/vendorSide/numberAdd.dart';
import 'package:vendorapp/vendorSide/serviceSelection.dart';
import 'package:vendorapp/widgets/callout.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/title2.dart';

import '../../widgets/title3.dart';
import '../../widgets/title4.dart';


class TypeCategory extends StatefulWidget {
  String categoryName;
  Map<String, String> type;
  TypeCategory({super.key,required this.categoryName,required this.type});

  @override
  State<TypeCategory> createState() => _TypeCategoryState();
}

class _TypeCategoryState extends State<TypeCategory> {
  String? _selectedValue1;
  String? imgAddress;
  final _formKey = GlobalKey<FormState>();
  final cost = TextEditingController();
  final description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      Container(
                            height: 70.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/logo2.jpg'),
                                  fit: BoxFit.fill,
                              ),
                                )
                          ),
                  SizedBox(height: 20.h,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Title4(heading: "Category Name", color: Colors.black, weight: FontWeight.bold,),
                        Title4(heading: "${widget.categoryName}", color: Colors.black, weight: FontWeight.bold,),
                        
                      ],
                     ),
                  SizedBox(height: 20.h,),
                  Title2(heading: "Select Category of Service", color: Color(0xff034047)),
                  SizedBox(height: 20.h,),
                  
                     Container(
                                width: 230.w,
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(20.r)),
                                child: Padding(
                                  padding:EdgeInsets.only(top: 1.h,bottom: 1.h,right: 10.w,left: 10.w),
                                  child: Container(
                                    width: 200,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      dropdownColor: Colors.white,
                                     
                                      iconEnabledColor: Colors.black,
                                      // hint: Multi(
                                      //     color: Colors.white,
                                      //     subtitle: "Select Your Area",
                                      //     weight: FontWeight.normal,
                                      //     size: 10),
                                      value: _selectedValue1,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedValue1 = value;
                                         imgAddress= widget.type[_selectedValue1];
            
                                        });
                                        print(widget.type);
                                        // Provider11.areaCode =
                                        //     int.parse(value.toString());
                                        
                                      },
                                      items: widget.type.entries.map((entry) {
                                        return DropdownMenuItem(
                                          value: entry.key,
                                          child: Text(
                                            entry.key,
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                               SizedBox(height: 20.h,),
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
                                      controller:cost ,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                      // for below version 2 use this
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
                                  // for version 2 and greater youcan also use this
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                          
                                      ],
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding:  EdgeInsets.only(top: 10.h,bottom: 10.h),
                                          child: Text("Rs",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                        ),
                                         suffixIcon: Padding(
                                          padding:  EdgeInsets.only(top: 10.h,bottom: 10.h),
                                          child: Text("/hr",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                        ),
                                        border: InputBorder.none,
                                          enabledBorder: null,
                                            focusedBorder: null,
                                        hintText: "in pakistani rupee",
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
                                  Labels(heading: "Service Description", color: Color(0xff034047)),
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
                                      controller:description ,
                                    keyboardType: TextInputType.multiline,
                                      minLines: 1,//Normal textInputField will be displayed
                                      maxLines: 5,//keyboardType: TextInputType.multiline,
                          
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                          enabledBorder: null,
                                            focusedBorder: null,
                                        hintText: "Describe Your Service...",
                                      )
                                  ),
                                    )
                                  ),
                                ],
                              ),
                               SizedBox(height: 20.h,),
                Container(
                                height: 30.h,
                                width: 100.w,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                         Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => RemainingAttr(name: _selectedValue1, cat: widget.categoryName, cost: cost.text, imgAddress: imgAddress, description: description.text)),);
                                    }
                                     
                                     
                                  },
                                  child: Text("Proceed"),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Color(0xff034047)),
                                  ),
                                ))
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}