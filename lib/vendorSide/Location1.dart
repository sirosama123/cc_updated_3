import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/service_provider.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/vendorSide/fixer_completed.dart';
import 'package:vendorapp/vendorSide/map.dart';
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


class Location1 extends StatelessWidget {
  const Location1({super.key});

  @override
  Widget build(BuildContext context) {
        final Provider11 = Provider.of<Provider1>(context); 
          final _formKey = GlobalKey<FormState>();
            TextEditingController street = TextEditingController();
  TextEditingController addres = TextEditingController();
  TextEditingController nearby = TextEditingController();
  TextEditingController number = TextEditingController();
    _getCurrentLocation() async {
      EasyLoading.show(status: 'loading...');
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      Provider11.lat = position.latitude;
      Provider11.lon = position.longitude;
      print(Provider11.lat);
            EasyLoading.showSuccess('Done!');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GoogleMapShow()),
        );

    }


    addAddress(){
      Dialogs.materialDialog(
                    msg: 'Write your Complete Address Here ',
                    color: Colors.white,
                    context: context,
                    actions: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Field is empty';
                                  }
                                  return null;
                                },
                                controller: addres,
                                cursorColor: Color(0xff2032EB),
                                decoration: InputDecoration(
                                  hintText: "Enter your Address",
                                  helperStyle: TextStyle(fontSize: 10),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
                                controller: street,
                                cursorColor: Color(0xff2032EB),
                                decoration: InputDecoration(
                                  hintText: "Street Number",
                                  helperStyle: TextStyle(fontSize: 10),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
                                controller: nearby,
                                cursorColor: Color(0xff2032EB),
                                decoration: InputDecoration(
                                  hintText: "Nearby Places",
                                  helperStyle: TextStyle(fontSize: 10),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xff2032EB)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                           IconsButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  Provider11.address=addres.text;
                                  FirebaseFirestore db = FirebaseFirestore.instance;
                                  await db.collection("vendors").doc(Provider11.uid).update({
                                      "complete_address":addres.text,
                                    });
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FixerCompleted()),
                                  );
                                }
                              },
                              text: 'Ok',
                              iconData: Icons.check_box,
                              color: Color(0xff034047),
                              textStyle: TextStyle(color: Colors.white),
                              iconColor: Colors.white,
                            )
                          ],
                        ),
                      )
                    ]);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Title1(heading: "Locate Me", color: Color(0xff034047)),
              SizedBox(height: 10.h,),
              Container(
                        height: 48.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: ()async {
                            _getCurrentLocation();
                          
                          },
                          child: Text("Take Current Location"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff034047)),
                          ),
                        )),
              SizedBox(height: 10.h,),
              Container(
                        height: 48.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: ()async {
                            // if (_formKey.currentState!.validate() && dob != "") {
                            //   await createAccount();
                       
                            // }
      
                            //          Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => NumberAdd()),
                            // );
                            addAddress();
                          },
                          child: Text("Add Address"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff034047)),
                          ),
                        ))
            ],
          ),
        ),
      ),
    ),
    builder: EasyLoading.init(),
    );
  }
}