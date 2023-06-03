import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
import 'package:vendorapp/widgets/callout.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import '../provider/provider1.dart';
import '../vendorSide/serviceSelection.dart';
import 'login.dart';

class FixerSignup extends StatefulWidget {
  const FixerSignup({super.key});

  @override
  State<FixerSignup> createState() => _FixerSignupState();
}

class _FixerSignupState extends State<FixerSignup> {
 
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController cnic = TextEditingController();
  @override

  bool status= false;
 late bool _passwordVisible;
   void initState() {
    _passwordVisible = false;
    }
    bool _showPassword = false;
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final Provider11 = Provider.of<Provider1>(context); 
    var obsText = true;
    createAccount() async {
      final bool isValid = EmailValidator.validate(email.text);
      if (isValid==true) {
        try {
        setState(() {
          status=true;
        });
        FirebaseAuth auth = FirebaseAuth.instance;
        FirebaseFirestore db = FirebaseFirestore.instance;
        final UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        Provider11.uid=user.user!.uid;
        db.collection("users").doc(user.user!.uid).set({
          "fullname": fullname.text,
          "email": email.text,
          "uid": user.user!.uid,
          "phone": phone.text,
          "cnic": cnic.text,
          "profile": "https://cdn-icons-png.flaticon.com/512/1077/1077012.png"
        });
        await  FirebaseDatabase.instance.ref('appers/${Provider11.uid}').set({
        "amount":"2000"
      });
        setState(() {
          status=false;
        });
         Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Terms()),
                          );
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(
          msg: "${e.message}",
          toastLength: Toast.LENGTH_SHORT,
        );
        setState(() {
          status=false;
        });
      }
      } else {
         Fluttertoast.showToast(
          msg: "Email is badly formatted",
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffc6d8e2),
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 35.h),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                            
                            
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            Center(child: Heading(heading: "User Sign Up")),
                            SizedBox(height: 15.h,),
                            Labels(heading: "Full Name", color: Color(0xff034047)),
                            Container(
                              child: TextFormField(
                                  controller: fullname,
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
                                    Icons.person,
                                    color: Color(0xff034047) ,
                                  ),
                                  
                                ),
                                
                              ),
                            ),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Labels(heading: "Phone Number", color: Color(0xff034047)),
                             Container(
                                child: TextFormField(
                                  controller: phone,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(11),
                                  ],
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Field is empty';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(color: Color(0xff034047)),
                                  decoration: InputDecoration(
                                      hintText: "xxxxxxxxxxx",
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xff034047)),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xff034047)),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: Color(0xff034047),
                                      ),
                                      prefixIconColor: Color(0xff034047)),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Labels(heading: "CNIC", color: Color(0xff034047)),
                             Container(
                                child: TextFormField(
                                  controller: cnic,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(11),
                                  ],
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Field is empty';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(color: Color(0xff034047)),
                                  decoration: InputDecoration(
                                      hintText: "xxxxxxxxxxxxx",
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xff034047)),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xff034047)),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.card_membership,
                                        color: Color(0xff034047),
                                      ),
                                      prefixIconColor: Color(0xff034047)),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                       Container(
                                height: 48.h,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                       createAccount();
                                    }
                                  },
                                  child: Text("Sign in"),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Color(0xff034047)),
                                  ),
                                )),
                        SizedBox(height: 10.h,),
                    //      Padding(
                    //         padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: [
                    //           Container(
                    //             height: 2.h,
                    //             width: 70.w,
                    //             color: Color(0xff034047),
                    //           ),
                    //           Text("OR",style: TextStyle(color: Color(0xff034047),fontSize: 20.sp),),
                    //           Container(
                    //             height: 2.h,
                    //             width: 70.w,
                    //             color: Color(0xff034047),
                    //           ),
                    //           ],
                    //         ),
                    // ),
                    // SizedBox(height: 10.h,),
                    Row(
                      children: [
                        //  Container(
                        //         height: 48.h,
                        //         width: 160.w,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(20),
                                  
                        //         ),
                        //         child: ElevatedButton(
                        //           onPressed: () {
                        //             Navigator.push(
                        //             context,
                        //             MaterialPageRoute(builder: (context) => MyApp1(pics: [],)),);
                        //           },
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //             children: [
                        //               Callout(heading: "Signin with", color: Color.fromARGB(255, 17, 84, 138)),
                        //               SizedBox(width: 4.w,),
                        //               Image.asset("assets/images/facebook.png",height: 35.h,width: 35.w,)
                        //             ],
                        //           ),
                        //           style: ButtonStyle(
                        //             backgroundColor:
                        //                 MaterialStateProperty.all(Colors.white),
                        //           ),
                        //         )),
                        //         SizedBox(width: 4.h,),
                                //  Container(
                                // height: 48.h,
                                // width: 160.w,
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(20),
                                  
                                // ),
                                // child: ElevatedButton(
                                //   onPressed: () {
                                //     Navigator.push(
                                //     context,
                                //     MaterialPageRoute(builder: (context) => MyApp1(pics: [],)),);
                                //   },
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //     children: [
                                //       Callout(heading: "Signin with", color: Color.fromARGB(255, 17, 84, 138)),
                                //       SizedBox(width: 4.w,),
                                //       Image.asset("assets/images/google.png",height: 35.h,width: 35.w,)
                                //     ],
                                //   ),
                                //   style: ButtonStyle(
                                //     backgroundColor:
                                //         MaterialStateProperty.all(Colors.white),
                                //   ),
                                // )),
                      ],
                    )
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
        ) ,
      ),
    );
  }
}