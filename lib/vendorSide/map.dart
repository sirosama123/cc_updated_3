import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
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
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title2.dart';
import 'package:vendorapp/widgets/title3.dart';
import '../provider/provider1.dart';
import 'fixer_completed.dart';


class GoogleMapShow extends StatelessWidget {
  const GoogleMapShow({super.key});

  @override
  
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller = Completer();
     final Provider11 = Provider.of<Provider1>(context); 

     addData()async{
      FirebaseFirestore db = FirebaseFirestore.instance;
      await db.collection("vendors").doc(Provider11.uid).update({
          "latitude":Provider11.lat,
          "longitude":Provider11.lon,
        });
     }
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
          
            Container(
              child: GoogleMap(
                zoomControlsEnabled: false,
               
                initialCameraPosition:
                                CameraPosition(
                                  target: LatLng(double.parse(Provider11.lat.toString()), double.parse(Provider11.lon.toString())), 
                                  zoom: 12
                                  ),
               markers: {
                 Marker(
                                markerId: MarkerId("Your Location"),
                                position: LatLng(double.parse(Provider11.lat.toString()), double.parse(Provider11.lon.toString())),
                                
                                 
                              ),
               },
               
              ),
            ),
              Align(
              alignment: Alignment.bottomCenter,
              child:  Padding(
                padding:EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                child: Container(
                      height: 48.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          addData();
                           Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FixerCompleted()),
                                  );
                        },
                        child: Text("Save"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff034047)),
                        ),
                      )),
              ),
            ),
             Align(
              alignment: Alignment.topCenter,
              child:  Container(
                    height: 48.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 5),
                          color: Color(0xff034047),
                          blurRadius: 5,
                          
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r)
                      )
                    ),
                    child:Center(
                      child: Title1(heading: "Your Current Location", color: Color(0xff034047)),
                    )
                    ),
            ),
          ],
        ),
      ),
    );
  }
}