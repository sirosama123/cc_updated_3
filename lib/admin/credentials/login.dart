import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
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

import '../../provider/provider1.dart';
import '../adminHome.dart';
import 'forgot.dart';


class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  late bool _passwordVisible;
   void initState() {
    _passwordVisible = false;
    }
    bool _showPassword = false;
  @override
   TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
     var obsText = true;
      bool status = false;
  Widget build(BuildContext context) {
    
   
  @override
  final _formKey = GlobalKey<FormState>();
    final Provider11 = Provider.of<Provider1>(context); 
 
  String? uuid;
   void Login() async{
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      setState(() {
        status=true;
      });
      final Future<FirebaseApp> _initialization = Firebase.initializeApp();
      try {
        final UserCredential users = await auth.signInWithEmailAndPassword(
        email: email.text, password: password.text);

        setState(() {
          Provider11.uid = users.user!.uid;
          uuid =users.user!.uid;
          
        });

         var data = await FirebaseFirestore.instance.
          collection("admin").
          doc(users.user!.uid). 
          get();
   
          setState(() {
            Provider11.fullname=data['name'];
            Provider11.email=data['email'];
            Provider11.uid = data['uid'];
            Provider11.phone = data['phone'];
            Provider11.profile = data['profile'];
          });
          setState(() {
            status = false;
          });
                    
    
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
          );
     
      } 
        on FirebaseAuthException catch(e) {
        print(e);
        Fluttertoast.showToast(
          msg: "${e.message}",
          toastLength: Toast.LENGTH_SHORT,
      );
      }
      setState(() {
        status=false;
      });
    }  
    return Scaffold(
      body: Stack(
        children: [
          Center(
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
                          Center(child: Heading(heading: "Admin Log in")),
                         
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labels(heading: "Email", color: Color(0xff034047)),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Labels(heading: "Password", color: Color(0xff034047)),
                              Container(
                                child: TextFormField(
                                  obscureText: obsText
                                  ,
                                   validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Field is empty';
                                    }
                                    return null;
                                  },
                                  controller: password,
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
                                        suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: this._showPassword ? Color(0xff034047) : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() => this._showPassword = !this._showPassword);
                                },
                            ), 
                                    prefixIcon: Icon(
                                      Icons.key,
                                      color: Color(0xff034047) ,
                                    ),
                                    prefixIconColor: Color(0xff034047)
                                  ),
                                ),
                              ),
                          SizedBox(height: 4.h,),
                          Row(
                            children: [
                              Container(),
                              GestureDetector(
                                onTap: (){
                                      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotAdmin()),
          );
                                },
                                child: ForgotLink(link: "Forgot password?", color: Color(0xff034047)))
                            ],
                          )
                        ],
                      ),
                     
                     
                      SizedBox(height: 10.h,),
                      Container(
                              height: 48.h,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                  
                                Login();
                                  }
                                  
                                },
                                child: Text("Log in"),
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
            status==false?Container(): Align(
              alignment: Alignment.center,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Color(0xff034047).withOpacity(0.6),
                child: Center(
                  child: Container(
                    height: 120.h,
                    width: 120.w,
                     decoration: BoxDecoration(
                      color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(color: Color(0xff034047),width: 2)
                          ),
                    child: Stack(
                      children: [
                        
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                          height: 70.h,
                          width: 70.w,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(15.r),
                          //   border: Border.all(color: Colors.white,width: 2)
                          // ),
                          child:Image.asset('assets/images/logopng.png',height: 20.h,width: 20.w,)
                        ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 90.h,
                            width: 90.w,
                            child: CircularProgressIndicator(
                              
                              color: Color(0xff034047),),
                          )),
                      ],
                    ),
                  ),
                ),
              ),
            )
        ],
      ) ,
    );
  }
}