import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/vendorSide/verifyNumber.dart';
import 'package:vendorapp/vendorSide/workexperience.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/link.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';

class ServiceType extends StatefulWidget {
  const ServiceType({super.key});

  @override
  State<ServiceType> createState() => _ServiceTypeState();
}

class _ServiceTypeState extends State<ServiceType> {
  @override

 
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;
  bool value8 = false;
  bool value9 = false;

  List<dynamic> services=[];

  working(){
    if (value1==true) {
      services.add("Plumbing");
    }
    if(value2==true){
      services.add("Air Condition");
    }
    if (value3==true) {
      services.add("Electric");
    }
    if(value4==true){
      services.add("Handy man");
    }
    if (value5==true) {
      services.add("Fumigation");
    }
    if(value6==true){
      services.add("House");
    }
    if (value7==true) {
      services.add("Hair");
    }
    if(value8==true){
      services.add("Make up");
    }
    if(value9==true){
      services.add("Kitchen");
    }

  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
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
                            image: AssetImage('assets/images/logo2.jpg'),
                            fit: BoxFit.fill,
                          ),
                        )),
                    SizedBox(
                      width: 15.w,
                    ),
                    Title3(
                      heading: "Services Types",
                      color: Color(0xff034047),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 145.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff034047),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                                // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: this.value1,
                                        onChanged: ((value) {
                                          setState(() {
                                            this.value1 = value!;

                                          });
                                        }),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        image: new DecorationImage(
                                      image: new AssetImage(
                                          "assets/images/plumbing.png"),
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SubHead(
                                      heading: "Plumbing\nServices",
                                      color: Colors.black),
                                ],
                              )),
                        ),
                        Container(
                          height: 145.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff034047),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                                // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: this.value2,
                                        onChanged: ((value) {
                                          setState(() {
                                            this.value2 = value!;
                                          });
                                        }),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        image: new DecorationImage(
                                      image: new AssetImage(
                                          "assets/images/ac.png"),
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SubHead(
                                      heading:
                                          "\t\t\t\t\t\t\t\t\t\t\tAc\nmaintainance",
                                      color: Colors.black),
                                ],
                              )),
                        ),
                        Container(
                          height: 145.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff034047),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                                // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: this.value3,
                                        onChanged: ((value) {
                                          setState(() {
                                            this.value3 = value!;
                                          });
                                        }),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        image: new DecorationImage(
                                      image: new AssetImage(
                                          "assets/images/electric.png"),
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SubHead(
                                      heading: "\tElectric\nServices",
                                      color: Colors.black),
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 145.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff034047),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                                // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: this.value4,
                                        onChanged: ((value) {
                                          setState(() {
                                            this.value4 = value!;
                                          });
                                        }),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        image: new DecorationImage(
                                      image: new AssetImage(
                                          "assets/images/mechanic.png"),
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SubHead(
                                      heading: "HandyMan", color: Colors.black),
                                ],
                              )),
                        ),
                        Container(
                          height: 145.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff034047),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                                // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: this.value5,
                                        onChanged: ((value) {
                                          setState(() {
                                            this.value5 = value!;
                                          });
                                        }),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        image: new DecorationImage(
                                      image: new AssetImage(
                                          "assets/images/insecticide.png"),
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SubHead(
                                      heading: "Fumigation",
                                      color: Colors.black),
                                ],
                              )),
                        ),
                        Container(
                          height: 145.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff034047),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                                // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: this.value6,
                                        onChanged: ((value) {
                                          setState(() {
                                            this.value6 = value!;
                                          });
                                        }),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        image: new DecorationImage(
                                      image: new AssetImage(
                                          "assets/images/cleaning.png"),
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SubHead(
                                      heading: "\t\tHouse\nCleaning",
                                      color: Colors.black),
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 145.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff034047),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                                // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: this.value7,
                                        onChanged: ((value) {
                                          setState(() {
                                            this.value7 = value!;
                                          });
                                        }),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        image: new DecorationImage(
                                      image: new AssetImage(
                                          "assets/images/hairdresser.png"),
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SubHead(heading: "Hair", color: Colors.black),
                                ],
                              )),
                        ),
                        Container(
                          height: 145.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff034047),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                                // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: this.value8,
                                        onChanged: ((value) {
                                          setState(() {
                                            this.value8 = value!;
                                          });
                                        }),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        image: new DecorationImage(
                                      image: new AssetImage(
                                          "assets/images/cosmetics.png"),
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SubHead(
                                      heading: "MakeUp", color: Colors.black),
                                ],
                              )),
                        ),
                        Container(
                          height: 145.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff034047),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                                // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: this.value9,
                                        onChanged: ((value) {
                                          setState(() {
                                            this.value9 = value!;
                                          });
                                        }),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        image: new DecorationImage(
                                      image: new AssetImage(
                                          "assets/images/kitchen.png"),
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  SubHead(
                                      heading: "Kitchen", color: Colors.black),
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                        height: 48.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: ()async {
await working();
final CollectionReference collectionRef = FirebaseFirestore.instance.collection('my_collection');
final Map<String, dynamic> data = {
  'my_list_field': services
};
collectionRef.add(data);

print(services);
                            // Navigator.push(
                            // context,
                            // MaterialPageRoute(builder: (context) => WorkExperience()),);
                          },
                          child: Text("Save"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff034047)),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
