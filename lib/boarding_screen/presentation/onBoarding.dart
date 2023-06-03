import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/sign_log.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  int activeStep = 0;
  int dotCount = 3;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 68.h,
          ),
          SizedBox(
            height: 272.h,
            width: 280.w,
            child: Image(
              image: AssetImage(contents[activeStep].image),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          DotStepper(
            activeStep: activeStep,
            dotCount: dotCount,
            shape: Shape.circle,
            dotRadius: 6,
            spacing: 8,
            indicator: Indicator.worm,
            onDotTapped: (dotindex) {
              setState(() {
                activeStep = dotindex;
              });
            },
            fixedDotDecoration: FixedDotDecoration(
              color: Color(0xffc6d8e2),
              
            ),
            indicatorDecoration: IndicatorDecoration(color: Color(0xff034047)),
          ),
          SizedBox(height: 15.h),
          Center(child: Heading(heading: contents[activeStep].title)),
          SizedBox(height: 24.h),
  
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              child: activeStep > 1
                  ? Container(
                      height: 48.h,
                      width: 312.w,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => sign_log()),);
                        },
                        child: Text("Lets start"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff034047)),
                        ),
                      ))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          ElevatedButton(
                            onPressed: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => sign_log()),);
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(color: Color(0xff1C1C1C)),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                activeStep++;
                              });
                            },
                            child: Text("Next"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color(0xff034047)),
                            ),
                          ),
                        ]),
            ),
          )
        ],
      )),
    );
  }
}

