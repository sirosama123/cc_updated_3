import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/provider_description.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/profile2.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/title2.dart';
import 'package:vendorapp/widgets/title3.dart';

import '../provider/provider1.dart';

class ServiceProvider extends StatelessWidget {
  String? uno;
  String? nature;
  ServiceProvider({super.key,required this.uno,required this.nature});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
     final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('$uno').snapshots();
   
   
   
//     Future<DocumentSnapshot> getData() async{
//       CollectionReference usersRef = FirebaseFirestore.instance.collection(uno.toString());
//       QuerySnapshot snapshot = await usersRef.get();
// print(snapshot.docs);
// // Loop through the query results and print each document's data
// snapshot.docs.forEach((document) {
//   print(document['uid']);
//   print(uno);
// });


    // }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
         appBar: AppBar(
          backgroundColor: Color(0xff034047),
          title: Text("$uno"),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
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
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Profile2(name: data['pname'], availability: data['availability'], service: data['name'], uid: data['uid'],),
            );
             
          }).toList(),
        );
      },
    )
      ),
        // SingleChildScrollView(
        //   child: Padding(
        //     padding:  EdgeInsets.symmetric(horizontal: 10.w),
        //     child: Column(
        //       children: [
        //         SizedBox(height: 10.h,),
        //         GestureDetector(
        //           onTap: (){
                    
        //           },
        //           child: Profile2(name: "Nasir", availability: "Available", service: service)),
        //         SizedBox(height: 10.h,),
        //         Profile2(name: "Nadeem", availability: "Unavailable", service: service),
        //         SizedBox(height: 10.h,),
        //         Profile2(name: "Sahir", availability: "Available", service: service),
        //         SizedBox(height: 10.h,),
        //         Profile2(name: "Shahzawaz", availability: "Unavailable", service: service),
        //         SizedBox(height: 10.h,),
        //       ],
        //     ),
        //   ),
        // ) ,
      
    );
  }
}