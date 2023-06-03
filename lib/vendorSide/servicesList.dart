import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/vendorSide/serviceDetail.dart';
import 'package:vendorapp/widgets/dashboardSquare.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:vendorapp/widgets/jobs.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/title4.dart';
import 'package:vendorapp/widgets/title5.dart';
import 'package:vendorapp/widgets/wideSquaresDb.dart';

import '../provider/provider1.dart';
import '../widgets/labelsField.dart';
import '../widgets/title3.dart';
import 'addService/category.dart';

class ServicesList1 extends StatefulWidget {
  @override
    _ServicesList1State createState() => _ServicesList1State();
}

class _ServicesList1State extends State<ServicesList1> {
 

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
     final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('works').doc(Provider11.uid).collection("sub").snapshots();
    return (
      Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xff034047),
          foregroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCategory()),);
          },
          icon: Icon(Icons.add_circle_outline,color: Colors.white,),
          label: Title4(heading: "Add Service", color: Colors.white, weight: FontWeight.bold,),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                
                stream: _usersStream,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
              
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  if(snapshot.hasData){
                    return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ServiceDetail(availability: data['availability'], description: data['description'], img: data['imgAddress'], price: data['price'], serviceN: data['name'], cat: data['category'],)),);
                        },
                        child: Padding(
                          padding:EdgeInsets.all(8.0),
                          child: Container(
                             decoration: BoxDecoration(
                                color: Color.fromARGB(255, 205, 203, 203),
                                borderRadius: BorderRadius.circular(15.r)),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                        
                                        
                                           Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 5.w),
                                            child: Container(
                                              child: Column(
                                                children: [
                                                Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Title4(heading: "Rs ", color: Colors.black, weight: FontWeight.bold,),
                                                Title4(heading: "${data['price']}", color: Colors.black, weight: FontWeight.bold,),
                                              ],
                                            ),
                                             Container(
                                      height: 20.h,
                                      width: 80.w,
                                      child: ElevatedButton(
                                        onPressed: () {
                                           
                                        },
                                        child: Text("Finish"),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(Color(0xff034047)),
                                        ),
                                      ))
                                          ],
                                        ),
                                        SizedBox(height: 5.h,),
                                                 Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(CupertinoIcons.briefcase,color:Color(0xff034047) ,),
                                                        SizedBox(width: 4.w,),
                                                        Labels(heading: "Service Name ", color: Color(0xff034047)),
                                                      ],
                                                    ),
                                                    Labels(heading: "${data['name']}", color: Color(0xff034047)),
                                                  ],
                                                   ),
                        
                                                  
                                                 
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(CupertinoIcons.camera,color:Color(0xff034047) ,),
                                                          SizedBox(width: 4.w,),
                                                          Labels(heading: "Image", color: Color(0xff034047)),
                                                        ],
                                                      ),
                                                      Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                                '${data['imgAddress']}'),
                            fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                                        )
                                                    ],
                                                  ),
                                                
                                  ],
                                  ),),
                            
                                  ),
                                   Title5(heading: "${data['description']}", color: Color(0xff034047), weight: FontWeight.w500,),
                                   
                                  ]),
                              ),
                            ),
                          ),
                        ),
                      );
                      
                      //  ListTile(
                      //   title: Text(data['name']),
                       
                      // );
                    }).toList(),
                  );
                  }
                  return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      return ListTile(
                        title: Text('name'),
                        subtitle: Text(data['category']),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
           
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //                         height: 20.h,
              //                         width: 80.w,
              //                         child: ElevatedButton(
              //                           onPressed: () {
                                         
              //                               //   Navigator.push(
              //                               // context,
              //                               // MaterialPageRoute(builder: (context) => TypeCategory(categoryName: catName.toString(), type: type)),);
                                           
              //                           },
              //                           child: Text("Finish"),
              //                           style: ButtonStyle(
              //                             backgroundColor:
              //                                 MaterialStateProperty.all(Color(0xff034047)),
              //                           ),
              //                         )),
              // )
          ],
        ) ,
      ));
  }
}