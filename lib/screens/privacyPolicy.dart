import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/widgets/post_task_list.dart';
import 'package:vendorapp/widgets/requestTask.dart';
import 'package:vendorapp/widgets/smallDesc.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../widgets/BTitle2.dart';
import '../widgets/labelsField.dart';


class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ), 
          backgroundColor: Color(0xff034047),
          title: Text("Privacy Policy"),
        ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
  'Data Storage and Security:',
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
),
SizedBox(height: 10.h,),
Text(
  'The policy will detail how user data is stored and protected. It may mention the use of encryption, secure servers, and other measures to safeguard user information. It might also highlight any data retention periods and processes for data deletion upon request.',
  style: TextStyle(
    fontSize: 14,
  ),
),
SizedBox(height: 20.h),
Text(
  'Sharing of Data:',
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
),
SizedBox(height: 10.h,),
Text(
  'The policy will clarify if and when user data is shared with third parties. This may include sharing with service providers to fulfill user requests or with trusted partners for marketing and analytics purposes. It should also specify that personal data is not sold to third parties.',
  style: TextStyle(
    fontSize: 14,
  ),
),
SizedBox(height: 20.h),
Text(
  'User Control and Rights:',
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
),
SizedBox(height: 10.h,),
Text(
  'The privacy policy should inform users of their rights regarding their personal data. This may include the ability to access, modify, or delete their information. It should also outline the process for exercising these rights and contacting the app\'s data protection officer or customer support.',
  style: TextStyle(
    fontSize: 14,
  ),
),

            ],
          ),
        ),
      ),
      
    );
  }
}