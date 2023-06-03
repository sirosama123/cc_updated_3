import 'dart:async';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/vendorSide/profile.dart';
import 'package:vendorapp/vendorSide/servicesList.dart';
import 'package:vendorapp/widgets/BTitle2.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:flutter/material.dart';
import 'package:vendorapp/widgets/mainHomeVendor.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'package:vendorapp/widgets/title4.dart';
import 'package:vendorapp/widgets/title5.dart';

import '../../provider/provider1.dart';
import '../../widgets/link.dart';
import '../../widgets/multiText.dart';

class JobLocation extends StatelessWidget {
  JobLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller = Completer();
    final Provider11 = Provider.of<Provider1>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xff034047),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: 15.h,),
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: Colors.pink,
                child: CircleAvatar(
                      radius: 22.r,
                      backgroundImage:
                          NetworkImage("${Provider11.profile}"),
                      backgroundColor: Colors.blue,
                    ),
              ),
              SizedBox(width: 5.w,),
              Column(
                children: [
                  Title4(heading: "${Provider11.fullname}", color: Color(0xff034047), weight: FontWeight.w600,),
                  Title5(heading: "${Provider11.address}", color: Color(0xff034047), weight: FontWeight.w600)
                ],
              )
            ],
          ),
        ),
            SizedBox(height: 15.h,),
            Container(
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.4),
                  border: Border.all(color: Colors.red, width: 0.8)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Multi(
                    color: Colors.red,
                    subtitle: "Pending",
                    weight: FontWeight.bold,
                    size: 25),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Multi(
                color: Colors.black,
                subtitle: "Electrician Required For Work",
                weight: FontWeight.bold,
                size: 14),
            SizedBox(
              height: 7.h,
            ),
            Multi(
                color: Colors.black,
                subtitle:
                    "x jqs xj d cdkc j dcj wcd n d k cd nx csdci wjcd na s cwj cjwi cjw cwdnc sn cjwcdj ie jdcsnk kws cdjk cwoc w cdw jkdc jc wodc wdjo cjs ",
                weight: FontWeight.normal,
                size: 10),
            SizedBox(
              height: 7.h,
            ),
            Container(
              height: 200.h,
              width: double.infinity,
              child: GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                    target: LatLng(62.34,27.32),
                    zoom: 12),
                markers: {
                  Marker(
                    markerId: MarkerId("Your Location"),
                    position: LatLng(62.34,27.32),
                  ),
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Multi(
                color: Colors.black,
                subtitle: "Job Location",
                weight: FontWeight.bold,
                size: 14),
            SizedBox(
              height: 10.h,
            ),
            Multi(
                color: Colors.black,
                subtitle:
                    "x jqs xj d cdkc j dcj wcd n d k cd nx csdci wjcd na s cwj cjwi cjw cwdnc sn cjwcdj ie jdcsnk kws cdjk cwoc w cdw jkdc jc wodc wdjo cjs ",
                weight: FontWeight.normal,
                size: 10),
             SizedBox(
              height: 10.h,
            ),
            Container(
                height: 48.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                
                  },
                  child: Text("Go Back to Job Details"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff034047)),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
