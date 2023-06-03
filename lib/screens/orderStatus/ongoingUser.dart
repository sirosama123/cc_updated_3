import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider1.dart';
import '../../widgets/multiText.dart';
import '../../widgets/myjobRect.dart';

class OngoingUsers extends StatelessWidget {
  const OngoingUsers({super.key});

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
    final stream1 = FirebaseFirestore.instance.collection('users').doc(Provider11.uid).collection("orders_ongoing").snapshots();
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
                  },
                  child:  MyJobRect(jobtype: data['jobTask'], name: data['name'], servicetype:data['oid'], status: data['status'], profile: data['profile'],),)),
            );
          }).toList(),
        );
      },
    );
  }
}

