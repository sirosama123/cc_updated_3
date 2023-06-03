import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/admin/credentials/login.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/screens/terms.dart';
import 'package:vendorapp/screens/testing.dart';
import 'package:vendorapp/vendorSide/vendorHome.dart';
import 'package:vendorapp/widgets/callout.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/forgotLink.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';


class ForgotAdmin extends StatelessWidget {
  const ForgotAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    reset()async{
      final _auth = FirebaseAuth.instance;
      try {
        await _auth
        .sendPasswordResetEmail(email: email.text);
       showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  content: Text("Email has ben sent to you ,check your mail also spam mail to reset password."),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Colors.white,
                        padding:  EdgeInsets.all(14),
                        child:  Text("okay",style: TextStyle(
                          color: Color(0xff034047)
                        ),),
                      ),
                    ),
                  ],
                ),
              );
      } catch (e) {
         showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  content: Text("$e"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Colors.white,
                        padding:  EdgeInsets.all(14),
                        child:  Text("okay",style: TextStyle(
                          color: Color(0xff034047)
                        ),),
                      ),
                    ),
                  ],
                ),
              );
      }
      
    }
  @override
  final _formKey = GlobalKey<FormState>();
  bool statee = false;
  String? uuid;
    return Scaffold(
      body: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 35.h),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
            
                  
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Center(child: Heading(heading: "Forgot Password?")),
                     
                    ],
                  ),
                  SizedBox(height: 25.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Labels(heading: "Enter Email here", color: Color(0xff034047)),
                      Container(
                        child: TextFormField(
                          controller: email,
                          style: TextStyle(
                            color:Color(0xff034047) 
                          ),
                          decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide(color: Color(0xff034047)),   
                          ),  
                          focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff034047)),
                              ),  
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xff034047) ,
                            ),
                            prefixIconColor: Color(0xff034047)
                          ),
                        ),
                      ),
                    ],
                  ),
                 
                 
                 
                  SizedBox(height: 10.h,),
                  statee==false?Container(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                 reset();
                                // Navigator.push(
                                // context,
                                // MaterialPageRoute(builder: (context) => Terms()),);
                              }
                              
                            },
                            child: Text("Reset Password"),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff034047)),
                            ),
                          )):Center(child: CircularProgressIndicator(color: Colors.white,),),
                  
                ],
              ),
            ),
          ),
        ) ,
    );
  }
}