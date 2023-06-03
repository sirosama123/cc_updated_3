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

import '../provider/provider1.dart';
import '../vendorSide/jobs.dart';


class VendorMain extends StatefulWidget {
  const VendorMain({super.key});

  @override
  State<VendorMain> createState() => _VendorMainState();
}

class _VendorMainState extends State<VendorMain> {
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
         final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('works').doc(Provider11.uid).collection("sub").snapshots();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SquareDB(heading: " Total\t\nAcknowlegments", value: "4"),
                SquareDB(heading: " Total\t\nAcknowlegments", value: "313"),
                SquareDB(heading: " Total\t\nAcknowlegments", value: "114"),
              ],
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  wideSquareDB1(heading: "${Provider11.total_experience} years of Experience"),
                  wideSquareDB(heading: "Reviews", icon: Icon(Icons.star,color: Colors.yellow,), value: "4"),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Heading2(heading: "Primary Service", color: Color(0xff034047)),
            ),
           
            Container(
              
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
                     return   Container(
              child: GridView.builder(
               physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> data =
                      snapshot.data!.docs[index].data()! as Map<String, dynamic>;
                 return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 7.w,vertical: 7.w),
      child: GestureDetector(
        onTap: (){
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Jobs1(name: data['name'])),);
        },
        child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "${data['name']}", address: "${data['imgAddress']}", nature: '',)),
    );
                },
              ),
            );
                     GridView.count(
                      shrinkWrap: true,
          crossAxisCount: 2, // Number of columns in the grid
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
         return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "${data['name']}", address: "${data['imgAddress']}", nature: '',),
    );
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
           
//             GridView.builder(
//               shrinkWrap: true,
//   itemCount: Provider11.names.length,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   mainAxisExtent: 150.h,
                  
//                   crossAxisCount: 2,
//                 ),
//                 physics: BouncingScrollPhysics(),

//   itemBuilder: (BuildContext context, int index) {
//     return Padding(
//       padding:  EdgeInsets.symmetric(horizontal: 20.w),
//       child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "${Provider11.names[index]}", address: "${Provider11.imgs[index]}"),
//     );
//   },
// ),
             SizedBox(height: 20.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Heading2(heading: "Jobs", color: Color(0xff034047)),
            ),
            SizedBox(height: 5.h,),
            Title5(heading: "Posted Jobs", color: Colors.grey, weight: FontWeight.w600),
            SizedBox(height: 15.h,),
            MyWidget()
         
      
          ],
        ),
      ),
    ),
    );
  }
}









class MyWidget extends StatelessWidget {
  



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
              padding:  EdgeInsets.only(bottom:4.h),
              child: Container(
                child: Provider11.tasks!.contains(data['service'].toString())?Jobs(value: data['charges'], date: data['date'], id: data['oid'], name: data['customer_name'], address: data['address'],):Container()),
            );
             ListTile(
              title: Text(data['service']),
              
            );
          }).toList(),
        );
      },
    );
  }
}

