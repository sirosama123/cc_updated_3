import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/admin/subScreens/userDetail.dart';
import 'package:vendorapp/admin/subScreens/vendorDetail.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
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

import '../../widgets/titleTune.dart';
import '../widgets/userListView.dart';


class UsersListAdmin extends StatefulWidget {
UsersListAdmin({super.key});

  @override
  State<UsersListAdmin> createState() => _UsersListAdminState();
}

class _UsersListAdminState extends State<UsersListAdmin> {
  @override
  String page = "users";
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: TitleTune(heading: "$page", color: Colors.white, weight: FontWeight.bold, size: 21),
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
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Center(
                             child: Container(
                                         height: 100.h,
                                         width: 100.w,
                                         decoration: BoxDecoration(
                                           image: DecorationImage(
                                             image: AssetImage(
                                               'assets/images/logopng.png'),
                                               fit: BoxFit.fill,
                                           ),
                                             )
                                       ),
                           ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        page="users";
                      });
                    },
                    child: Container(
                                  height: 30.h,
                                  width:80.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: page=='users'?Color(0xff034047):Colors.transparent,width: 2),
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 4, 81, 89),
                        offset: const Offset(0, 0),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxSha
                    ],
                    color: Colors.white
                                  ),
                                  child: Center(
                    child: Title5(heading: "Users", color: Color.fromARGB(255, 4, 81, 89), weight: FontWeight.bold),
                                  ),
                                ),
                  ),
              GestureDetector(
                    onTap: (){
                      setState(() {
                        page="vendors";
                      });
                    },
                    child: 
                 Container(
                  height: 30.h,
                  width:80.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: page=='vendors'?Color(0xff034047):Colors.transparent,width: 2),
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 4, 81, 89),
                        offset: const Offset(0, 0),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxSha
                    ],
                    color: Colors.white
                  ),
                  child: Center(
                    child: Title5(heading: "Vendors", color: Color.fromARGB(255, 4, 81, 89), weight: FontWeight.bold),
                  ),
                ),
              )
                ],
              ),
        
              SizedBox(height: 20.h,),
      
              page=='vendors'?Container(
               
                child: VendorsList()):Container(
                 
                  child: UsersList())
            ],
          ),
        ),
      ),
      ),
    );
  }
}

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
     return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Padding(
                    padding:  EdgeInsets.only(top: 15.h,right: 10.w,left: 10.w),
                    child: GestureDetector(
                      onTap: (){
                          Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => UserDetail(
                                  
                                    
                                      cnic: data['cnic'], 
                                     
                                      email: data['email'], 
                                      
                                      name: data['fullname'], 
                                      phone: data['phone'], 
                                    
                                      uid: data['uid'],
                                      profile:data['profile'] ,
                                      ),
                                  ));
                      },
                      child: UserListView(img: data['profile'], name:data['fullname'], status: 'user',)),
                  );
          }).toList(),
        );
      },
    );
  }
}


class VendorsList extends StatelessWidget {
  const VendorsList({super.key});

  @override
  Widget build(BuildContext context) {
   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('vendors').snapshots();
     return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Padding(
                    padding:  EdgeInsets.only(top: 15.h,right: 10.w,left: 10.w),
                    child: GestureDetector(
                      onTap: (){
                         Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => VendorDetail(
                                      address: data['address'], 
                                      age: "age", 
                                      cnic: data['cnic'], 
                                      dob: data['dob'], 
                                      email: data['email'], 
                                      experience: data['total_experience'], 
                                      gender: data['gender'], 
                                      name: data['fullname'], 
                                      phone: data['phone'], 
                                      services: "services", 
                                      uid: data['uid'],
                                      profile:data['profile'] ,
                                      ),
                                  ));
                      },
                      child: UserListView(img: data['profile'], name:data['fullname'], status: 'vendor',)),
                  );
          }).toList(),
        );
      },
    );
  }
}