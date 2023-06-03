import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vendorapp/admin/adminHome.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/boarding_screen/presentation/onBoarding.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/screens/terms.dart';
import 'package:vendorapp/screens/testing.dart';
import 'package:vendorapp/vendorSide/createAccount.dart';
import 'package:vendorapp/vendorSide/loginVendor.dart';
import 'package:vendorapp/vendorSide/numberAdd.dart';
import 'package:vendorapp/widgets/callout.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/multiText.dart';
import 'package:vendorapp/widgets/shadowText.dart';
import 'dart:ui' as ui;
import 'admin/credentials/login.dart';


class Initial extends StatelessWidget {
  const Initial({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        body: Container(
           height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/initial_back.png"),
        fit: BoxFit.cover)
      ),
      child: Center(
            
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 20.w),
                       child: Shimmer.fromColors(
                              child: ShadowText(
                                  color: Color(0xff034047),
                                  shadowColor: Color(0xffc6d8e2),
                                  subtitle: "Welcome To",
                                  weight: FontWeight.w600,
                                  size: 26),
                              baseColor: Color(0xffc6d8e2),
                              highlightColor: Color(0xff034047)),
                     ),
                      SizedBox(height: 5.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                        child: Shimmer.fromColors(
                              child: ShadowText(
                                  color: Color(0xff034047),
                                  shadowColor: Color(0xffc6d8e2),
                                  subtitle: "House Ease Smart App",
                                  weight: FontWeight.w600,
                                  size: 23),
                              baseColor: Color(0xffc6d8e2),
                              highlightColor: Color(0xff034047)),
                      ),
                      SizedBox(height: 20.h,),
                      // Container(
                      //       height: 48.h,
                      //       width: double.infinity,
                      //       child: ElevatedButton(
                      //         onPressed: () {
                         
                      //         },
                      //         child: Text("Customer App"),
                      //         style: ButtonStyle(
                      //           backgroundColor:
                      //               MaterialStateProperty.all(Color(0xff034047)),
                      //         ),
                      //       )),
                            // SizedBox(height: 20.h,),
                            // Container(
                            // height: 48.h,
                            // width: double.infinity,
                            // child: ElevatedButton(
                            //   onPressed: () {
                          
                            //   },
                            //   child: Text("Vendor App"),
                            //   style: ButtonStyle(
                            //     backgroundColor:
                            //         MaterialStateProperty.all(Color(0xff034047)),
                            //   ),
                            // )),
                            //  SizedBox(height: 20.h,),
                            // Container(
                            // height: 48.h,
                            // width: double.infinity,
                            // child: ElevatedButton(
                            //   onPressed: () {
                            
                            //   },
                            //   child: Text("Admin Panel"),
                            //   style: ButtonStyle(
                            //     backgroundColor:
                            //         MaterialStateProperty.all(Color(0xff034047)),
                            //   ),
                            // )),
            
                            Padding(
                            padding: EdgeInsets.only(top: 0.h),
                            child:  DropShadow(
                              child: GestureDetector(
                                onTap: (){
             Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OnBoarding()),);
                                },
                                child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(14.r),
                                            color: Color(0xff034047)),
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        top: 0,
                                        child: CustomPaint(
                                          size: Size(100, 150),
                                          painter: CustomCardShapePainter(
                                            14,
                                            Color(0xff034047),
                                           Color(0xff034047),
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child:    Center(
                                          child: Multi(
                                                          color: Colors.white,
                                                          subtitle: "Proceed as Customer",
                                                          weight: FontWeight.bold,
                                                          size: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                            ),
                            ),
                            SizedBox(height: 0.h,),
                               Padding(
                            padding: EdgeInsets.only(top: 0.h),
                            child:  DropShadow(
                              child: GestureDetector(
                                onTap: (){
             Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FixerSignin()),);
                                },
                                child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(14.r),
                                            color: Color(0xff034047)),
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        top: 0,
                                        child: CustomPaint(
                                          size: Size(100, 150),
                                          painter: CustomCardShapePainter(
                                            14,
                                            Color(0xff034047),
                                           Color(0xff034047),
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child:    Center(
                                          child: Multi(
                                                          color: Colors.white,
                                                          subtitle: "Proceed as Vendor",
                                                          weight: FontWeight.bold,
                                                          size: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                            ),
                            ),
                            SizedBox(height: 0.h,),
                               Padding(
                            padding: EdgeInsets.only(top: 0.h),
                            child:  DropShadow(
                              child: GestureDetector(
                                onTap: (){
            
                                Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => LoginAdmin()),);
                                },
                                child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(14.r),
                                            color: Color(0xff034047)),
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        top: 0,
                                        child: CustomPaint(
                                          size: Size(100, 150),
                                          painter: CustomCardShapePainter(
                                            14,
                                            Color(0xff034047),
                                           Color(0xff034047),
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child:    Center(
                                          child: Multi(
                                                          color: Colors.white,
                                                          subtitle: "Proceed as Admin",
                                                          weight: FontWeight.bold,
                                                          size: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                            ),
                            ),
                    
                    ],
                  ),
                
               ),
        )
    );
  }
}





class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 10.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}