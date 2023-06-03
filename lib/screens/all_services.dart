import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_to_expand/tap_to_expand.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/service_provider.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/title2.dart';
import 'package:vendorapp/widgets/title3.dart';

import '../widgets/title4.dart';
import '../widgets/titleTune.dart';


class AllServices extends StatefulWidget {
  const AllServices({super.key});

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  @override
  Stream<DocumentSnapshot> _servicesStream = FirebaseFirestore.instance.collection('services').doc("Ao19VKeJIAD7kpgTCfkH").snapshots();
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff034047),
          title: Text("All Services"),
            leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ), 
        ),
        body:  StreamBuilder<DocumentSnapshot>(
      stream: _servicesStream,
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

       Map<String, dynamic>? userData = snapshot.data!.data()! as Map<String, dynamic>;
    // Access the user data using userData['FIELD_NAME']
    return 
      ListView.builder(
                shrinkWrap: true,
               
                scrollDirection: Axis.vertical,
                itemCount:userData.keys.toList().length ,
                itemBuilder: (context,int){
                  return Padding(
                    padding:  EdgeInsets.only(top: 15.h,right: 10.w,left: 10.w),
                    child: Column(
                      children: [
                        Title3(heading: "${userData.keys.toList()[int]}", color: Color(0xff034047)),
                        SizedBox(height: 10.h,),
                        GridView.builder(
                          shrinkWrap: true,
                           physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 6,
                  crossAxisSpacing:6,
                ),
                itemCount: userData.values.toList()[int].keys.length ,
                       itemBuilder: (context,i){
                  return  GestureDetector(
                                  child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "${userData.values.toList()[int].values.toList()[i]['name']}", address: "${userData.values.toList()[int].values.toList()[i]['img']}",  nature: '${userData.values.toList()[int].values.toList()[i]['nature']}',),
                                   onTap: (){
                                    print('${userData.values.toList()[int].values.toList()[i]['nature']}');
                                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ServiceProvider(uno: '${userData.values.toList()[int].values.toList()[i]['name']}', nature: '${userData.values.toList()[int].values.toList()[i]['nature']}',)),);
                                  },
                                  );
                }
              )
                      ],
                    )
                    
        //             TapToExpand(
        //               color: Color(0xff034047),
        //   content:ListView.builder(
        //      shrinkWrap: true,
        //         // physics: NeverScrollableScrollPhysics(),
        //         scrollDirection: Axis.vertical,
        //          itemCount:userData.values.toList()[int].keys.length ,
        //         itemBuilder: (context,i){
        //           return  Container(
        //     child:TitleTune(heading: "${userData.values.toList()[int].values.toList()[i]['name']}", color: Colors.white, weight: FontWeight.bold, size: 10) ,
        //   );
        //         }
        //   ),
         
        //   title: Title4(heading: "${userData.keys.toList()[int]}", color: Colors.white, weight: FontWeight.bold),
        //   onTapPadding: 10,
        //   closedHeight: 70,
        //   scrollable: true,
        //   borderRadius: 10,
        //   openedHeight: 200,
        // ),
                    //  Text("${userData.keys.toList()[int]}"),
                  );
                });
        
      
   } )
        // Padding(
        //   padding:  EdgeInsets.symmetric(horizontal: 20.w),
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         Title3(heading: "Appliances Repair", color: Color(0xff034047)),
        //          SizedBox(height: 10.h,),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Air Cooler',)),);
        //                           },
        //                           child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Air Cooler", address: "assets/images/aircooler.png"),
        //                           ),
        //                         GestureDetector(
        //                           child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Microwave", address: "assets/images/microwave.png"),
        //                            onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Microwave',)),);
        //                           },
        //                           ),
        //                          GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Ac Maintenance',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "\t\t\t\t\t\t\t\t\t\t\tAc\nmaintainance", address: "assets/images/ac.png")),
        //                       ],
        //                     ),
        //                     SizedBox(height: 10.h,),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Refrigerator',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Refrigerator", address: "assets/images/refrigerator.png")),
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'TV',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "TV", address: "assets/images/tv.png")),
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Washing Machine',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Washing\nmachine", address: "assets/images/washing.png")),
        //                       ],
        //                     ),
        //                     SizedBox(height: 10.h,),  
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Water Purifier',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Water\nPurifier", address: "assets/images/water.png")),
                     
        //                       ],
        //                     ),
        //                     SizedBox(height: 10.h,),  
        //         Title3(heading: "Women salon and spa deals ", color: Color(0xff034047)),
        //          SizedBox(height: 10.h,),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Hair',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Hair", address: "assets/images/hairdresser.png")),
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'MakeUp',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "MakeUp", address: "assets/images/cosmetics.png")),
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Nails',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Nails", address: "assets/images/fingernail.png")),
        //                       ],
        //                     ),
              
        //                     SizedBox(height: 10.h,),  
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Lasers',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Lasers", address: "assets/images/laser.png")),
                     
        //                       ],
        //                     ),
        //                     SizedBox(height: 10.h,),        
        //       Title3(heading: "Cleaning and pest control", color: Color(0xff034047)),
        //          SizedBox(height: 10.h,),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Bathroom',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Bathroom", address: "assets/images/toilet.png")),
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Kitchen',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Kitchen", address: "assets/images/kitchen.png")),
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Full Home Cleaning',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "full home\ncleaning", address: "assets/images/cleaning.png")),
        //                       ],
        //                     ),
        //                     SizedBox(height: 10.h,),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Sofa Carpet',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Sofa\nCarpet", address: "assets/images/sofa.png")),
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Fumigation',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Fumigation", address: "assets/images/insecticide.png")),
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Deep Cleaning',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Deep\nCleaning", address: "assets/images/deep.png")),
        //                       ],
        //                     ),
                           
        //                     SizedBox(height: 10.h,),  
        //         Title3(heading: "Maintenance service", color: Color(0xff034047)),
        //          SizedBox(height: 10.h,),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Electrician',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Electrician", address: "assets/images/electric.png")),
        //                        GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Plumber',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Plumber", address: "assets/images/plumbing.png")),
        //                        GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Carpenter',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Carpenter", address: "assets/images/carpenter.png")),
        //                       ],
        //                     ),
        //                     SizedBox(height: 10.h,),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Furniture',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Furniture", address: "assets/images/sofa.png")),
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Welder',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Welder", address: "assets/images/welder.png")),
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'False ceiling',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "False\nceiling", address: "assets/images/chandelier.png")),
        //                       ],
        //                     ),
        //                     SizedBox(height: 10.h,),     
        //         Title3(heading: "Health care service", color: Color(0xff034047)),
        //          SizedBox(height: 10.h,),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: [
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Doctor',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Doctor", address: "assets/images/doctor.png")),
        //                         SizedBox(width: 10.w,),
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Nurse',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Nurse", address: "assets/images/nurse.png")),     
        //                       ],
        //                     ),
        //                     SizedBox(height: 10.h,),
        //       Title3(heading: "Other services", color: Color(0xff034047)),
        //          SizedBox(height: 10.h,),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Home Painting',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Home\nPainting", address: "assets/images/painting.png")),
        //                        GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Car Detailing',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Car\t\nDetailing", address: "assets/images/detailing.png")),
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Car Mechanic',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Car\t\nMechanic", address: "assets/images/mechanic.png")),
        //                       ],
        //                     ),
        //                     SizedBox(height: 10.h,),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: [
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'CCTV Services',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "CCTV\t\nServices", address: "assets/images/cctv.png")),
        //                         SizedBox(width: 10.w,),
        //                         GestureDetector(
                                  
        //                           onTap: (){
        //                           Navigator.push(
        //                         context,
        //                         MaterialPageRoute(builder: (context) => ServiceProvider(uno: 'Movers',)),);
        //                           },child: Square(color1:Color(0xff034047) , color2: Colors.black, sub: "Movers", address: "assets/images/movers.png")),
        //                       ],
        //                     ),
        //                     SizedBox(height: 10.h,),     
                                     
        //       ],

        //     ),
        //   ),
        // ) ,

      ),
    );

  }
}