import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/confirmation_booking.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/post_detail.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/link.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/title2.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'dart:async';
import 'dart:io';

import '../../provider/provider1.dart';
import '../../widgets/post_task_list.dart';
import '../../widgets/titleTune.dart';
import '../orderDetail.dart';

class PostScreen extends StatelessWidget {
   PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
  length: 2,

        child: Scaffold(
           appBar: AppBar(
          title: TitleTune(heading: "Posted Orders", color: Colors.white, weight: FontWeight.bold, size: 21),
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
          bottom: TabBar(
          tabs: [
            Tab(child: TitleTune(heading: "Posted Orders", color: Colors.white, weight: FontWeight.bold, size: 10),),
            Tab(child: TitleTune(heading: "Posted Requests", color: Colors.white, weight: FontWeight.bold, size: 10),),
          ],
        ),
        ),
        body: TabBarView(
        children: [
          PostedTasks(),
          PostedRequests()
         
        ],
          ),
        ),
      ),
    );
  }
}

class PostedTasks extends StatelessWidget {
  const PostedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('jobs').snapshots();
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
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Container(
              child:Provider11.uid==data['uid']?Padding(
                padding:EdgeInsets.symmetric(horizontal: 10.w,vertical: 2.h),
                child: GestureDetector(
                  onTap: (){
                      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostDetail(
        address: data['address'], 
        budget: data['charges'], 
        datee: data['date'], 
        detail:data['service'] ,//data['detail'], 
        name: data['customer_name'], 
        oid: data['oid'], 
        service: data['service'], 
        timee:  data['date'], task_id: data['request_uid'], date_of_post: data['date_of_posting'], time_of_post: data['time_of_posting'],  //data['time']
        )),);
                  },
                  child: Container(
                   
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTune(
                              heading: "Order Id", 
                              color: Colors.black, 
                              weight: FontWeight.bold, 
                              size: 12
                              ),
                            TitleTune(
                              heading: data['oid'], 
                              color: Colors.black, 
                              weight: FontWeight.bold, 
                              size: 16
                              ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTune(
                              heading: "Service", 
                              color: Colors.black, 
                              weight: FontWeight.bold, 
                              size: 12
                              ),
                            TitleTune(
                              heading: data['service'], 
                              color: Colors.black, 
                              weight: FontWeight.bold, 
                              size: 16
                              ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),

              ):Container(),
            );
          }).toList(),
        );
      },
    );
  }
}





class PostedRequests extends StatelessWidget {
  const PostedRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').doc(Provider11.uid).collection('your_requests').snapshots();
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
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  if (data['status']=='accepted') {
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>OrderDetail(address: data['address'], budget: data['amount'], date_post: data['date_post'], service: data['service'], time_post: data['time_post'], oid: data['oid'],)),);
                  }
                },
                child: PostList(status: data['status'], time: data['time_post'], topic: data['service'])),
            );
          }).toList(),
        );
      },
    );
  }
}

