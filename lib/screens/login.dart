import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/admin/credentials/forgot.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/screens/testing.dart';
import 'package:vendorapp/widgets/callout.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/smaillTitlebold.dart';

import '../provider/provider1.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? uuid;
  bool? statee;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  bool status = false;
  late bool _passwordVisible;
   void initState() {
    _passwordVisible = false;
    }
    bool _showPassword = false;
  Widget build(BuildContext context) {
     var obsText = true;
    final _formKey = GlobalKey<FormState>();
    final Provider11 = Provider.of<Provider1>(context); 
      List<String>? vendor;
  List<String>? user;
     void Login() async{
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      setState(() {
        status=true;
      });
      final Future<FirebaseApp> _initialization = Firebase.initializeApp();
      final bool isValid = EmailValidator.validate(email.text);
      if (isValid==true) {
         try {
        final UserCredential users = await auth.signInWithEmailAndPassword(
        email: email.text, password: password.text);

        setState(() {
          Provider11.uid = users.user!.uid;
          uuid =users.user!.uid;
          
        });

         var data = await FirebaseFirestore.instance.
          collection("users").
          doc(users.user!.uid). 
          get();
   
          setState(() {
            Provider11.fullname=data['fullname'];
            Provider11.email=data['email'];
            Provider11.cnic = data['cnic'];
            Provider11.uid = data['uid'];
            Provider11.phone = data['phone'];
            Provider11.profile = data['profile'];
          });
          setState(() {
            statee = false;
          });
           await FirebaseFirestore.instance
        .collection("banners")
        .doc('X8xwi93SqrXE8ZeEoh5g')
        .get()
        .then((value) {
        setState(() {
           
         user = List.from(value.data()!['userapp']);
        });
                    
    });
          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp1(pics: user!,)),
                          );
     
      } 
        on FirebaseAuthException catch(e) {
        print(e);
        Fluttertoast.showToast(
          msg: "${e.message}",
          toastLength: Toast.LENGTH_SHORT,
      );
      }
      } else {
         Fluttertoast.showToast(
          msg: "Email is badly formatted",
          toastLength: Toast.LENGTH_SHORT,
      );
      }
   
      setState(() {
        status=false;
      });
    }  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffc6d8e2),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.w),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                             Center(
                               child: Container(
                                           height: 100.h,
                                           width: 100.w,
                                           decoration: BoxDecoration(
                                             image: DecorationImage(
                                               image: AssetImage(
                                                 'assets/images/logopng.png'),
                                                 fit: BoxFit.fill,
                                             ),
                                               )
                                         ),
                             ),
                SizedBox(height: 20.h,),
                          Column(
                                  
                                 mainAxisAlignment: MainAxisAlignment.center,
                            
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child: Heading(heading: "User Log in")),
                            
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
                                   validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Field is empty';
                                    }
                                    return null;
                                  },
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
                                  controller: password,
                                   obscureText: !this._showPassword,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Field is empty';
                                    }
                                    return null;
                                  },
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
                            ],
                          ),
                            
                         
                          SizedBox(height: 10.h,),
                          Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                               Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotAdmin()),);
                            },
                            child: Stitle(linkText: "Forgot Password?")),
                          Container()
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
                                    child: Text("Sign in"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Color(0xff034047)),
                                    ),
                                  )),
                          SizedBox(height: 10.h,),
                          
                          
                      SizedBox(height: 10.h,),
                      
                      // Row(
                      //   children: [
                      //      Container(
                      //             height: 48.h,
                      //             width: 160.w,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(20),
                                    
                      //             ),
                      //             child: ElevatedButton(
                      //               onPressed: () {
                      //                 Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(builder: (context) => MyApp1(pics: [],)),);
                      //               },
                      //               child: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //                 children: [
                      //                   Callout(heading: "Signin with", color: Color.fromARGB(255, 17, 84, 138)),
                      //                   SizedBox(width: 4.w,),
                      //                   Image.asset("assets/images/facebook.png",height: 35.h,width: 35.w,)
                      //                 ],
                      //               ),
                      //               style: ButtonStyle(
                      //                 backgroundColor:
                      //                     MaterialStateProperty.all(Colors.white),
                      //               ),
                      //             )),
                      //             SizedBox(width: 4.h,),
                      //              Container(
                      //             height: 48.h,
                      //             width: 160.w,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(20),
                                    
                      //             ),
                      //             child: ElevatedButton(
                      //               onPressed: () {
                      //                 Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(builder: (context) => MyApp1(pics: [],)),);
                      //               },
                      //               child: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //                 children: [
                      //                   Callout(heading: "Signin with", color: Color.fromARGB(255, 17, 84, 138)),
                      //                   SizedBox(width: 4.w,),
                      //                   Image.asset("assets/images/google.png",height: 35.h,width: 35.w,)
                      //                 ],
                      //               ),
                      //               style: ButtonStyle(
                      //                 backgroundColor:
                      //                     MaterialStateProperty.all(Colors.white),
                      //               ),
                      //             )),
                      //   ],
                      // )
                        ],
                      ),
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
          ),
        ) ,
      ),
    );
  }
}