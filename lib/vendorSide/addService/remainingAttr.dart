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
import 'package:vendorapp/vendorSide/vendorHome.dart';
import 'package:vendorapp/widgets/callout.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/title2.dart';

import '../../provider/provider1.dart';
import '../../widgets/squares.dart';
import '../../widgets/title4.dart';


class RemainingAttr extends StatelessWidget {
  String? name;
  String? cat;
  String? cost;
  String? imgAddress;
  String? description;
   RemainingAttr({super.key,required this.name,required this.cat,required this.cost,required this.imgAddress,required this.description});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    serviceAdd1()async{
  DocumentReference servicesWork = FirebaseFirestore.instance.collection("${name}").doc("${Provider11.uid}");
final Map<String, dynamic> data = {
  'category': cat,
  'name': name,
  'imgAddress': imgAddress,
  'description': description,
  'price': cost,
  'uid': Provider11.uid,
  'pname':Provider11.fullname,
  "availability":"available"

};
await servicesWork.set(data); // Note that we use set() instead of add() to add a new document

      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => vendorHome()),);
    }
    serviceAdd()async{
      serviceAdd1();
      CollectionReference servicesWork = FirebaseFirestore.instance.collection('works').doc(Provider11.uid).collection("sub");
      final Map<String, dynamic> data = {
          'category': cat,
          'name':name,
          'imgAddress':imgAddress,
          'description':description,
          'price':cost,
          'pname':Provider11.fullname,
          "availability":"available"
        };
      await  servicesWork.add(data);
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => vendorHome()),);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Square(color1: Colors.white, color2: Colors.black, sub: "$name", address: imgAddress.toString(), nature: '',),
               
                SizedBox(height: 20.h,),
                Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Title4(heading: "Category Name", color: Colors.black, weight: FontWeight.bold,),
                         
                         Title4(heading: "${cat}", color: Colors.black, weight: FontWeight.bold,),    
                       ],
                      ),
                 SizedBox(height: 20.h,),
                Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Title4(heading: "Service Name", color: Colors.black, weight: FontWeight.bold,),
                         
                         Title4(heading: "${name}", color: Colors.black, weight: FontWeight.bold,),
                         
                       ],
                      ),
                 SizedBox(height: 20.h,),
                Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Title4(heading: "Cost", color: Colors.black, weight: FontWeight.bold,),
                         
                         Title4(heading: "Rs ${cost}", color: Colors.black, weight: FontWeight.bold,),
                         
                       ],
                      ),
                SizedBox(height: 20.h,),
                  Container(
                                height: 30.h,
                                width: 100.w,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // if (_formKey.currentState!.validate()) {
                                    //      Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => RemainingAttr(name: _selectedValue1, cat: widget.categoryName, cost: cost.text, imgAddress: imgAddress, description: description.text)),);
                                    // }
                                    serviceAdd();
                                 
                                  },
                                  child: Text("Add Service"),
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
    ),
    );
  }
}