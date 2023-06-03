import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../widgets/heading2.dart';
import '../../widgets/multi3.dart';









class ShowOnMap extends StatelessWidget {
  LatLng loc;
  String? name;
  String? address;
  String? city;
  ShowOnMap({super.key,required this.loc,required this.name,required this.address,required this.city});
  @override
  Widget build(BuildContext context) {
  final Completer<GoogleMapController> _controller = Completer();
 
    return Scaffold(
     appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ), 
          backgroundColor: Color(0xff034047),
          title: Text("Task Location"),
        ),
      body:Stack(
          children: [
          
            Container(
              child: GoogleMap(
                zoomControlsEnabled: false,
               
                initialCameraPosition:
                                CameraPosition(
                                  target: loc, 
                                  zoom: 12
                                  ),
               markers: {
                 Marker(
                                markerId: MarkerId("Your Location"),
                                position: loc,
                                
                                 
                              ),
               },
               
              ),
            ),
             Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 180.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffA4A4A4),
                        blurRadius: 6.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 0.0),
                        // Shadow position
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Multi3(color: Color(0xff2b578e), subtitle: "$name", weight: FontWeight.bold, size: 12),
Multi3(color: Color(0xff2b578e), subtitle: "$address", weight: FontWeight.bold, size: 12),
                        Container(
                          height: 30.h,
                          // width: 80.w,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 4.w),
                            child: Text(
                              "Job Task Location",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.w, right: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Multi3(color: Color(0xff2b578e), subtitle: "090908997", weight: FontWeight.bold, size: 12),
Multi3(color: Color(0xff2b578e), subtitle: "$city", weight: FontWeight.bold, size: 12),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      
      
    );
  }
}


