import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/widgets/dashboardSquare.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:vendorapp/widgets/jobs.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/title5.dart';
import 'package:vendorapp/widgets/wideSquaresDb.dart';

import '../../provider/provider1.dart';
import '../../widgets/titleTune.dart';
import '../customerServiceProfile.dart';
import '../request_details_screen.dart';

class BookingMainScreen extends StatelessWidget {
  const BookingMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
  length: 3,

        child: Scaffold(
           appBar: AppBar(
          title: TitleTune(heading: "Bookings", color: Colors.white, weight: FontWeight.bold, size: 21),
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
            Tab(child: TitleTune(heading: "Upcommings", color: Colors.white, weight: FontWeight.bold, size: 10),),
            Tab(child: TitleTune(heading: "Requests", color: Colors.white, weight: FontWeight.bold, size: 10),),
            Tab(child: TitleTune(heading: "Completed", color: Colors.white, weight: FontWeight.bold, size: 10),),
          ],
        ),
        ),
        body: TabBarView(
        children: [
          Upcomings(),
          Requests(),
          Icon(Icons.directions_transit, size: 350),
         
        ],
          ),
        ),
      ),
    );
  }
}

class Upcomings extends StatelessWidget {
  const Upcomings({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    final stream1 = FirebaseFirestore.instance.collection('jobs').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: stream1,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return  Padding(
              padding:  EdgeInsets.only(bottom:4.h,top: 2.h),
              child: Container(
                child: Provider11.tasks!.contains(data['service'].toString())?GestureDetector(
                  onTap: (){
                     Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CustomerServiceProfile(
                                address: data['address'], 
                                date: data['date'], 
                                jobtask: data['service'], 
                                name: data['customer_name'], 
                                status: data['status'], 
                                time: '13:10:00', img:data['profile'] ,
                                uid: data['uid'], jobUid: document.id, reqUid:data['request_uid'], amount: data['total'].toString(), oid: data['oid'], all_tasks_uid: data['posted_tasks_all'], pm: data['payment_method'] ,
                                )),);
                  },
                  child: Jobs(value: data['charges'], date: data['date'], id: data['oid'], name: data['customer_name'], address: data['address'],)):Container()),
            );
          }).toList(),
        );
      },
    );
  }
}

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    final stream1 = FirebaseFirestore.instance.collection('requestJobs').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: stream1,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return  Padding(
              padding:  EdgeInsets.only(bottom:4.h,top: 2.h),
              child: Container(
                child: data['provider_uid']==Provider11.uid?GestureDetector(
                  onTap: (){
                   
                     Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Request_Service_Details(
                              
                                name: data['name'], 
                               
                                time_of_post: data['time_post'], profile:data['profile'], address: data['address'], budget: data['amount'], datee: data['date'], detail: data['img'], timee: data['time'], doc_uid: document.id, uid: data['user_uid'], service: data['service'], user_doc: data['user_doc'],doc:data['doc'], oid: data['oid'],
                                )),);
                  },
                  child: Jobs(value: data['amount'], date: data['date'].toString().substring(0,11), id: data['oid'], name: data['name'], address: data['address'],)):Container()),
            );
          }).toList(),
        );
      },
    );
  }
}

