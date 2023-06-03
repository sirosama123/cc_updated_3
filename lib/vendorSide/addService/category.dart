import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/screens/terms.dart';
import 'package:vendorapp/screens/testing.dart';
import 'package:vendorapp/vendorSide/addService/type.dart';
import 'package:vendorapp/vendorSide/numberAdd.dart';
import 'package:vendorapp/vendorSide/serviceSelection.dart';
import 'package:vendorapp/widgets/callout.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/title2.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
    String? _selectedItem;
    String? catName;

  final Map<String,String> _items = {
    "0":"Appliances Repair",
    "1":"Women Salon & spa deals",
    "2":"Cleaning & Pesticides Control",
    "3":"Maintenance Services",
    "4":"Healthcare Service",
    "5":"Other Services"
  };
  
  // final Map<String, String> _items = {
  //   'Air Cooler': 'value1',
  //   'Microwave': 'value2',
  //   'Ac Maintenance': 'value3',
  //   'Refrigerator': 'value1',
  //   'TV': 'value2',
  //   'Washing Machine': 'value3',
  //   'Water Purifier': 'value1',
  // };

  final Map<String, String> ar = {
    'Air Cooler': 'assets/images/aircooler.png',
    'Microwave': 'assets/images/microwave.png',
    'Ac Maintenance': 'assets/images/ac.png',
    'Refrigerator': 'assets/images/refrigerator.png',
    'TV': 'assets/images/tv.png',
    'Washing Machine': 'assets/images/washing.png',
    'Water Purifier': 'assets/images/water.png',
  };

  final Map<String, String> ws = {
    'Hair': 'assets/images/hairdresser.png',
    'MakeUp': 'assets/images/cosmetics.png',
    'Nails': 'assets/images/fingernail.png',
    'Lasers': 'assets/images/laser.png',
  };

  final Map<String, String> cpc = {
    'Bathroom': 'assets/images/aircooler.png',
    'Kitchen': 'assets/images/kitchen.png',
    'Full Home Cleaning': 'assets/images/cleaning.png',
    'Sofa Carpet': 'assets/images/sofa.png',
    'Fumigation': 'assets/images/insecticide.png',
    'Deep Cleaning': 'assets/images/deep.png',
  };

   final Map<String, String> ms = {
    'Electrician': 'assets/images/electrician.png',
    'Plumber': 'assets/images/plumbing.png',
    'Carpenter': 'assets/images/carpenter.png',
    'Furniture': 'assets/images/sofa.png',
    'Welder': 'assets/images/welder.png',
    'False ceiling': 'assets/images/chandelier.png',
  };

  final Map<String, String> hcs = {
    'Doctor': 'assets/images/doctor.png',
    'Nurse': 'assets/images/nurse.png',
  };

    final Map<String, String> os = {
    'Home Painting': 'assets/images/painting.png',
    'Car Detailing': 'assets/images/detailing.png',
    'Car Mechanic': 'assets/images/mechanic.png',
    'CCTV Services': 'assets/images/cctv.png',
    'Movers': 'assets/images/movers.png',
  };

  late Map<String, String> type ={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xff034047),
        leading: GestureDetector(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff034047),
                Color.fromARGB(255, 4, 81, 89),
              ]),
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 4, 81, 89),
                  offset: const Offset(0, 0),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/logo2.jpg'),
                            fit: BoxFit.fill,
                        ),
                          )
                    ),
            SizedBox(height: 20.h,),
            Title2(heading: "Select Category of Service", color: Color(0xff034047)),
            SizedBox(height: 20.h,),
            Container(
                              width: 230.w,
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Padding(
                                padding:EdgeInsets.only(top: 1.h,bottom: 1.h,right: 10.w,left: 10.w),
                                child: Container(
                                  width: 200,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    dropdownColor: Colors.white,
                                    icon: null,
                                    iconEnabledColor: Colors.black,
                                    // hint: Multi(
                                    //     color: Colors.white,
                                    //     subtitle: "Select Your Area",
                                    //     weight: FontWeight.normal,
                                    //     size: 10),
                                    value: _selectedItem,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedItem = value;
                                        _items[_selectedItem];
                                         if (_selectedItem=="0") {
                                          setState(() {
                                            type=ar;
                                            catName="Appliances Repair";
                                          });
                                           Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => TypeCategory(categoryName: _selectedItem.toString(), type: type)),);
                                        }else if(_selectedItem=="1"){
                                          setState(() {
                                            type=ws;
                                            catName="Women Saloon & Spa Deals";
                                          });
                                           Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => TypeCategory(categoryName: _selectedItem.toString(), type: type)),);
                                        }else if(_selectedItem=="2"){
                                          setState(() {
                                            type=cpc;
                                            catName="Cleaning & Pesticides Control";
                                          });
                                           
                                        }else if(_selectedItem=="3"){
                                          setState(() {
                                            type=ms;
                                            catName="Maintenance Services";
                                          });
                                          
                                        }else if(_selectedItem=="4"){
                                           setState(() {
                                             type=hcs;
                                             catName="Health Services";
                                           });
                                         
                                        }else{
                                          setState(() {
                                            type=os;
                                            catName="Other Services";
                                          });
                                        
                                        }
                                      });
                                      // Provider11.areaCode =
                                      //     int.parse(value.toString());
                                      print(_selectedItem);
                                    },
                                    items: _items.entries.map((entry) {
                                      return DropdownMenuItem(
                                        value: entry.key,
                                        child: Text(
                                          entry.value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
            SizedBox(height: 20.h,),
            Container(
                            height: 30.h,
                            width: 100.w,
                            child: ElevatedButton(
                              onPressed: () {
                                print(type);
                                    Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => TypeCategory(categoryName: catName.toString(), type: type)),);
                                 
                              },
                              child: Text("Proceed"),
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


