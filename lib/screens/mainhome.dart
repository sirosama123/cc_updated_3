import 'dart:developer';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/all_services.dart';
import 'package:vendorapp/screens/service_provider.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/link.dart';
import 'package:vendorapp/widgets/profile.dart';
import 'package:vendorapp/widgets/slider.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title3.dart';

class MainHome extends StatefulWidget {
  List<String> pics;
  MainHome({super.key,required this.pics});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  int _currentIndex = 0;
  int _counter = 0;
  bool see = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       
        body: Container(
          child:Container(
            child: SingleChildScrollView(
              child: Column(
                children: [

                   Slider23(imgs: widget.pics),
                  
SizedBox(height: 5.h,),
                       Title3(heading: "All Services", color: Color(0xff034047)),
                SizedBox(height: 20.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Electrician', nature: 'asset',)),);
                              },
                              child: Square(
                                color1:Color(0xff034047) , color2: Colors.black, sub: "\tElectric\nServices", address: "assets/images/electric.png", nature: '',)),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Plumber', nature: 'asset',)),);
                              },
                              child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Plumbing\nServices", address: "assets/images/plumbing.png", nature: '',)),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Furniture', nature: 'asset',)),);
                              },
                              child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "\t\t\t\t\t\t\t\t\t\t\tAc\nmaintainance", address: "assets/images/ac.png", nature: '',)),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                 Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Movers', nature: 'asset',)),);
                              },
                              child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Movers", address: "assets/images/movers.png", nature: '',)),
                            GestureDetector(
                              onTap: (){
                               Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Fumigation', nature: 'asset',)),);
                              },
                              child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Fumigation", address: "assets/images/insecticide.png", nature: '',)),
                            GestureDetector(
                              onTap: (){
                                 Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Deep Cleaning', nature: 'asset',)),);
                              },
                              child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "\t\tHouse\nCleaning", address: "assets/images/cleaning.png", nature: '',)),
                          ],
                        ),
                       GestureDetector(child: Link(linkText: "see all"),onTap: (){
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AllServices()),);
                  setState(() {
                    see=true;
                  });
                },),
                      ],
                    ),
                  ),
                  
                ),

               
                
                SizedBox(height: 20.h,),
                Title3(heading: "Top Service Providers", color: Color(0xff034047)),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: 10.w),
                  child: TopProviders(),
                )
                ],
              ),
            ),
          ) ,
        ),
     
          
      ),
      
    );
  }
}




class TopProviders extends StatelessWidget {
  const TopProviders({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference collectionRef =
    FirebaseFirestore.instance.collection('vendors');

    Stream<QuerySnapshot> stream = collectionRef.snapshots();
 
    return StreamBuilder<QuerySnapshot>(
  stream: stream,
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }

    // Extract document snapshots from the stream
    List<DocumentSnapshot> documents = snapshot.data!.docs;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: documents.length,
      itemBuilder: (BuildContext context, int index) {
        Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;
        if (data['rating']>2) {
          return Padding(
            padding:EdgeInsets.only(bottom: 5.h),
            child: Profile(name: data['fullname'], profile: data['profile'], rating: double.parse(data['rating'].toString()), uid: data['uid']),
          );
        }
        // Build your UI widget for each item
      },
    );
  },
);
;
  }
}

























