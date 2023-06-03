import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/service_provider.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/vendorSide/vendorHome.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title2.dart';
import 'package:vendorapp/widgets/title3.dart';

class FixerCompleted extends StatefulWidget {
  const FixerCompleted({super.key});

  @override
  State<FixerCompleted> createState() => _FixerCompletedState();
}

class _FixerCompletedState extends State<FixerCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo3.png'),
                      fit: BoxFit.fill,
                    ),
                  )),
              SizedBox(
                height: 20.h,
              ),
              Heading(heading: '''
 Fixer Onboarding
Request  Completed
'''),
              SizedBox(
                height: 30.h,
              ),
              Container(
                  height: 200.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/check.png'),
                      fit: BoxFit.fill,
                    ),
                  )),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: SubHead(
                    heading: '''We will get back to you on your email after
            verifying your profile stay Tuned!''',
                    color: Color.fromARGB(255, 91, 86, 86)),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                  height: 48.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => vendorHome()),);
                    },
                    child: Text("Thank You"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff034047)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
