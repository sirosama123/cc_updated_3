import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider1.dart';
import '../../widgets/multiText.dart';
import '../../widgets/myjobRect.dart';
import 'jobDetails2.dart';

class Completed1 extends StatelessWidget {
  const Completed1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ), 
          backgroundColor: Color(0xff034047),
          title: Text("Ongoing Jobs"),
        ),
        body:tasks(),
    );
  }
}


class tasks extends StatelessWidget {
  const tasks({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    final stream1 = FirebaseFirestore.instance.collection('vendors').doc(Provider11.uid).collection("orders_completed").snapshots();
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
                child:GestureDetector(
                  onTap: (){
                   
                     Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => JobDetails2(
                                amount: data['amount'], 
                                datee: data['date'].toString().substring(0,11),
                                description: data['nsakl  kkn  j hj j '],
                                jobType: data['jobType'], 
                                serviceType: data['jobType'],
                                status: data['status'], 
                                time: data['time'], docId: document.id, user_uid: data['ongoing_uid'], user_personal_uid: data['uid'], name: data['name'], oid: data['oid'], user_profile: data['profile'], all_tasks_uid: data['all_tasks_uid'], pm: data['payment_method'],)
                     ));
                  },
                  child:  MyJobRect(jobtype: data['service'], name: data['name'], servicetype:data['service'], status: data['status'], profile: data['profile'],),)),
            );
          }).toList(),
        );
      },
    );
  }
}

