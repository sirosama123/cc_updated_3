import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/screens/testing.dart';
import 'package:vendorapp/vendorSide/createAccount.dart';
import 'package:vendorapp/vendorSide/serviceSelection.dart';
import 'package:vendorapp/widgets/callout.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/smaillTitlebold.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title3.dart';


class VerifyNumber extends StatefulWidget {
  const VerifyNumber({super.key});

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [   
                       Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/logo2.jpg'),
                              fit: BoxFit.fill,
                          ),
                            )
                      ),
                      SizedBox(width: 15.w,),
                      Title3(heading: "Please Enter the 4-digit\nVerification Code",color:Color(0xff034047) ,),              
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  SubHead(heading: "Code Has been sent to your registered\n\t\tPhone Number +92321******94", color: Colors.grey),
                  SizedBox(height: 20.h,),
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 50.h,
                              width: 50.w,
                              child: TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                              // for below version 2 use this
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
                            // for version 2 and greater youcan also use this
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1),

                              ],
                              decoration: InputDecoration(
                                  border:UnderlineInputBorder(      
                                    borderSide: BorderSide(color: Color(0xff034047))) ,
                                    enabledBorder: UnderlineInputBorder(      
                                    borderSide: BorderSide(color: Color(0xff034047)),   
                                ),  
                                    focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff034047)),
                                    ),  
                                )
                              )
                            ),
                            SizedBox(width: 10.w,),
                             Container(
                              height: 50.h,
                              width: 50.w,
                              child: TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                              // for below version 2 use this
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
                            // for version 2 and greater youcan also use this
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1),

                              ],
                              decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(      
                                    borderSide: BorderSide(color: Color(0xff034047)),   
                                ),  
                                    focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff034047)),
                                    ),  
                                )
                              )
                            ),
                            SizedBox(width: 10.w,),
                             Container(
                              height: 50.h,
                              width: 50.w,
                              child: TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                              // for below version 2 use this
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
                            // for version 2 and greater youcan also use this
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1),

                              ],
                              decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(      
                                    borderSide: BorderSide(color: Color(0xff034047)),   
                                ),  
                                    focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff034047)),
                                    ),  
                                )
                              )
                            ),
                            SizedBox(width: 20.w,),
                             Container(
                              height: 50.h,
                              width: 50.w,
                              child: TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                              // for below version 2 use this
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
                            // for version 2 and greater youcan also use this
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1),

                              ],
                              decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(      
                                    borderSide: BorderSide(color: Color(0xff034047)),   
                                ),  
                                    focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff034047)),
                                    ),  
                                )
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Container(
                        height: 48.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ServiceSelection()),);
                          },
                          child: Text("Send"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff034047)),
                          ),
              )
            ),
              ],
            ),
          )
          ),
      ),
    );
  }
}

