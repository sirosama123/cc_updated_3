import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/confirmation_booking.dart';
import 'package:vendorapp/screens/mainhome.dart';
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

import '../provider/provider1.dart';
import 'dart:async';
import 'dart:io';

class RequestService extends StatefulWidget {
  String service;
  String uid;
  RequestService({super.key,required this.service,required this.uid});

  @override
  State<RequestService> createState() => _RequestServiceState();
}

class _RequestServiceState extends State<RequestService> {
  String? _chosenValue;
  String? imagePath;
  @override
  final address = TextEditingController();
  final amount = TextEditingController();
  DateTime? RecievingDate = DateTime(2023,1,7);
  String? timee  = " ";
  Widget build(BuildContext context) {
  var uuid = Uuid();


    final Provider11 = Provider.of<Provider1>(context); 
    FirebaseFirestore db = FirebaseFirestore.instance;
    
         getLink()async{
        try {
          FirebaseFirestore db = FirebaseFirestore.instance;
        final storageRef = FirebaseStorage.instance.ref("${uuid.v1()}");
        File file = File(imagePath.toString());
        try {
          await  storageRef.putFile(file);
        print("File Uploaded Successfully profile");
        String downloadURL =  await storageRef.getDownloadURL();
        print(downloadURL);
        setState(() {
          imagePath=downloadURL;
        });
        } catch (e) {
          print(e);
        }
      //   Provider11.FrontFaceurl = downloadURL;
      //  await db.collection("vendors").doc(Provider11.uid).update({
      //     "profile":downloadURL
      //   });
        
        } catch (e) {
          print("${e} errr is here");
        }
      }

      void pickImageCamera() async{
      
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.camera);
   
       setState(() {
        imagePath = image!.path;
      });
      getLink();
      // showDialog(
      //           context: context,
      //           builder: (ctx) => AlertDialog(
      //             title: const Text("Do you want to upload this Image?"),
      //             actions: <Widget>[
      //               TextButton(
      //                onPressed: () {
      //                   // setState(() {
      //                   //   Provider11.imagePath = image.path;
      //                   // });
                         
      //                   Navigator.of(ctx).pop();},
      //                 child: Container(
      //                   color: Color(0xff2b578e),
      //                   padding: const EdgeInsets.all(14),
      //                   child: const Text("Yes",style: TextStyle(color: Colors.white),),
      //                 ),
      //               ),
      //               TextButton(
      //                  onPressed: (){
      //             setState(() {
      //                     imagePath = null;
                        
      //                   });
                        
      //                   Navigator.of(ctx).pop();
      //           },
      //                 child: Container(
      //                   color: Color(0xff2b578e),
      //                   padding: const EdgeInsets.all(14),
      //                   child: const Text("No",style: TextStyle(color: Colors.white),),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         );

    }
     void pickImageGallery() async{
      
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.gallery);  
      // Provider11.imagePath = image!.path;  
      setState(() {
        imagePath = image!.path;
      });
      await getLink();
      // showDialog(
      //           context: context,
      //           builder: (ctx) => AlertDialog(
      //             title: const Text("Do you want to upload this Precsription?"),
      //             content: Image.asset(image!.path),
      //             actions: <Widget>[
      //               TextButton(
      //                onPressed: () async{
      //                   // setState(() {
      //                   //   Provider11.imagePath = image.path;
      //                   // });
                       
      //                   Navigator.of(ctx).pop();},
      //                 child: Container(
      //                   color: Color(0xff2b578e),
      //                   padding: const EdgeInsets.all(14),
      //                   child: const Text("Yes",style: TextStyle(color: Colors.white),),
      //                 ),
      //               ),
      //               TextButton(
      //                  onPressed: (){
      //             setState(() {
      //                     imagePath = null;
      //                     // Provider11.imagePath = null;
      //                   });
      //                   Navigator.of(ctx).pop();
      //           },
      //                 child: Container(
      //                   color: Color(0xff2b578e),
      //                   padding: const EdgeInsets.all(14),
      //                   child: const Text("No",style: TextStyle(color: Colors.white),),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         );
            
       }
       Profile(){
       Dialogs.bottomMaterialDialog(
          msg: 'Select From where you want..',
          title: "Profile Picture",
          color: Colors.white,
          context: context,
          actions: [
           IconsButton(
              onPressed: () {
                pickImageGallery();
              },
              text: 'Gallery',
              iconData: Icons.picture_in_picture,
              color: Color(0xff034047),
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
            IconsButton(
              onPressed: () {
                pickImageCamera();
              },
              text: 'Camera',
              iconData: Icons.camera,
              color: Color(0xff034047),
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]);
    }
 String? oid;
    sendData()async{
      
      
      var uuid = Uuid();
      oid = uuid.v1().substring(0, 10);
    
      CollectionReference requestJobs = FirebaseFirestore.instance.collection('requestJobs');
      final yourRequests = FirebaseFirestore.instance.collection("users").doc(Provider11.uid).collection("your_requests");
     
    DocumentReference requestRef = await requestJobs.add({
       "user_uid":Provider11.uid,
        "address":address.text,
        "service":widget.service,
        "img":imagePath.toString(),
        "date":RecievingDate.toString(),
        "time":timee.toString(),
        "provider_uid":widget.uid.toString(),
        "status":"pending",
        "date_post":'${DateTime.now().day.toString()+","+DateTime.now().month.toString()}',
        "time_post":'${DateTime.now().hour.toString()+","+DateTime.now().minute.toString()}',
        "amount":amount.text,
        "profile":Provider11.profile,
        "name":Provider11.fullname,
        "doc":"",
        "user_doc":"",
        "code":0,
        "oid":oid
    });
   print(requestRef.id);
 
    DocumentReference urrequestRef= await yourRequests.add({
        "user_uid":Provider11.uid,
        "address":address.text,
        "service":widget.service,
        "img":imagePath.toString(),
        "date":RecievingDate.toString(),
        "time":timee.toString(),
        "provider_uid":widget.uid.toString(),
        "status":"pending",
        "date_post":'${DateTime.now().day.toString()+","+DateTime.now().month.toString()}',
        "time_post":'${DateTime.now().hour.toString()+","+DateTime.now().minute.toString()}',
        "amount":amount.text,
        "profile":Provider11.profile,
        "name":Provider11.fullname,
        "doc":"",
        "code":0,
        "oid":oid
        
      });
          final requestJobs_up = FirebaseFirestore.instance.collection("requestJobs").doc(requestRef.id);
     requestJobs_up.update({
      "doc":requestRef.id
     });
      final requestJobs_ur = FirebaseFirestore.instance.collection("users").doc(Provider11.uid).collection("your_requests").doc(urrequestRef.id).update({
        "doc":urrequestRef.id
      });
     requestJobs_up.update({
      "doc":requestRef.id,
      "user_doc":urrequestRef.id
     });
      showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Your Request Has been Send!"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Color(0xff034047),

                        padding:  EdgeInsets.all(14),
                        child:  Text("okay"),
                      ),
                    ),
                  ],
                ),
              );
    }







    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
         appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ), 
          backgroundColor: Color(0xff034047),
          title: Text("Request Service"),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(                  
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Labels(heading: "Your Address", color: Color(0xff034047)),
                        Container(
                          child: TextFormField(
                            controller: address,
                            style: TextStyle(
                              color:Color(0xff034047) 
                            ),
                            decoration: InputDecoration(
                               enabledBorder: UnderlineInputBorder(      
                            borderSide: BorderSide(color: Color(0xff034047)),   
                            ),  
                            focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff034047)),
                                ),  
                              prefixIcon: Icon(
                                Icons.home_filled,
                                color: Color(0xff034047) ,
                              ),
                              
                            ),
                            
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Labels(heading: "Amount Offers", color: Color(0xff034047)),
                        Container(
                          child: TextFormField(
                             keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                          ],
                
                            controller: amount,
                            style: TextStyle(
                              color:Color(0xff034047) 
                            ),
                            decoration: InputDecoration(
                               enabledBorder: UnderlineInputBorder(      
                            borderSide: BorderSide(color: Color(0xff034047)),   
                            ),  
                            focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff034047)),
                                ),  
                              prefixIcon: Icon(
                                Icons.monetization_on_outlined,
                                color: Color(0xff034047) ,
                              ),
                              
                            ),
                            
                          ),
                        ),
                        SizedBox(height: 20.h,),
                         Padding(
                           padding:  EdgeInsets.symmetric(horizontal: 5.w),
                           child: Container(
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:Color(0xff034047) ,
                      blurRadius: 6.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 0.0),
                      // Shadow position
                    ),
                  ],
                ),
                height:120.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Labels(heading: "Select Date", color: Color(0xff034047)),
                SizedBox(height: 5.h,),
                GestureDetector(
                  onTap: ()async{
                    DateTime? newDate = await showDatePicker (
                                                    context: context, 
                                                    initialDate:DateTime.now() , 
                                                    firstDate: DateTime(2023), 
                                                    lastDate: DateTime(2024)
                                                    );
                                                    if (newDate == null) {
                                                      return;
                                                    } else {
                                                      setState(() {
                                                        RecievingDate = newDate;
                                                      },);}

                  },
                  child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                            image: AssetImage(
                  'assets/images/date.png'),
                            fit: BoxFit.fill,
                    ),
                    
                  ),
                              ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Labels(heading: "Select Time", color: Color(0xff034047)),
                SizedBox(height: 5.h,),
                GestureDetector(
                  onTap: (){
                            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title:   Labels(heading: "Please Select Time",color: Colors.blue,),
                    content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
               Divider(),
               GestureDetector(child: Labels(heading: "9:00AM - 9:30AM",color: Colors.blue,),onTap: (){setState(() {
                 timee="9:00AM - 9:30AM";
               });  Navigator.of(ctx).pop();
                                    },),
               Divider(),
               GestureDetector(child:  Labels(heading: "9:00AM - 9:30AM",color: Colors.blue,),onTap: (){setState(() {
                timee="9:00AM - 9:30AM";
               });Navigator.of(ctx).pop();},),
               Divider(),
               GestureDetector(child:  Labels(heading: "10:00AM - 10:30AM",color: Colors.blue,),onTap: (){setState(() {
                 timee="10:00AM - 10:30AM";
               }); Navigator.of(ctx).pop();},),
               Divider(),
               GestureDetector(child:  Labels(heading: "11:00AM - 11:30AM",color: Colors.blue,),onTap: (){setState(() {
                 timee="11:00AM - 11:30AM";
               }); Navigator.of(ctx).pop();},),
               Divider(),
               GestureDetector(child:  Labels(heading: "12:00PM - 12:30PM",color: Colors.blue,),onTap: (){setState(() {
                 timee="12:00PM - 12:30PM";
               });Navigator.of(ctx).pop();},),
               Divider(),
               GestureDetector(child:  Labels(heading: "1:00PM - 1:30PM",color: Colors.blue,),onTap: (){setState(() {
                timee="1:00PM - 1:30PM";
               }); Navigator.of(ctx).pop();},),
               Divider(),
               GestureDetector(child:  Labels(heading: "2:00PM - 2:30PM",color: Colors.blue,),onTap: (){setState(() {
                 timee="2:00PM - 2:30PM";
               });Navigator.of(ctx).pop();},),
               Divider(),
            ],
          ),
        ),
                  actions: <Widget>[
                    TextButton(
                     onPressed: () {
                        Navigator.of(ctx).pop();},
                      child: Container(
                        color: Color(0xff2b578e),
                        padding: const EdgeInsets.all(14),
                        child: const Text("Yes",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              );
                  },
                  child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/clock.png'),
                      fit: BoxFit.fill,
                    ),
                    
                  ),
                              ),
                )
              ],
            )
                  ],
                ),
          
                ),
                         )
                      ],
                    ),
                    SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Labels(heading: "Service Information:", color: Color(0xff034047)),
                  Labels(heading: "${widget.service}", color: Color(0xff034047)),
                ],
              ),
              SizedBox(height: 20.h,),
              Labels(heading: "Describe Service In Detail:", color: Color(0xff034047)),
              SizedBox(height: 5.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                  child: Container(
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 181, 175, 175),
                    boxShadow: [
                      BoxShadow(
                        color:Color(0xff034047) ,
                        blurRadius: 6.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 0.0),
                        // Shadow position
                      ),
                    ],
                  ),
                  height:150.h,
                  width: double.infinity,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Title3(heading:imagePath==null? "Upload Image": "Image Uploaded", color: Colors.white),
                    Labels(heading: "PNG & JPEG are allowed", color: Colors.black),
                    Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            child: GestureDetector(
              onTap: (){
                Profile();
              },
              child: Container(
                height: 80.h,
                width: double.infinity,
                
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                          BoxShadow(
                            color:Colors.white ,
                            blurRadius: 6.0,
                            spreadRadius: 1.0,
                            offset: Offset(0.0, 0.0),
                            // Shadow position
                          ),
                        ],
                ),
                child: Image.asset("assets/images/download.png"),
              ),
            ),
                    )
                  ],
                  )
                  ),
                ),
          //       SizedBox(height: 20.h,),
          //      Padding(
          //        padding:  EdgeInsets.symmetric(horizontal: 20.w),
          //        child: Container(
          //         width: double.infinity,
          //          child: DropdownButton<String>(
          //   onChanged: (ValueKey){
          
          //   },
          //   focusColor:Colors.white,
          //   value: _chosenValue,
          //   //elevation: 5,
          //   style: TextStyle(color: Colors.white),
          //   iconEnabledColor:Colors.black,
          //   items: <String>[
          //     'Android',
          //     'IOS',
          //     'Flutter',
          //     'Node',
          //     'Java',
          //     'Python',
          //     'PHP',
          //   ].map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //   value: value,
          //   child: Text(value,style:TextStyle(color:Colors.black),),
          //     );
          //   }).toList(),
          //   hint:Text(
          //     "Terms & Conditions\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
          //     style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 14,
          //     fontWeight: FontWeight.w500),
          //   ),
            
          // ),
          //        ),
          //      ),
          //      SizedBox(height: 20.h,),
          //   Padding(
          //        padding:  EdgeInsets.symmetric(horizontal: 20.w),
          //        child: Container(
          //         width: double.infinity,
          //          child: DropdownButton<String>(
          //   onChanged: (ValueKey){
          
          //   },
          //   focusColor:Colors.white,
          //   value: _chosenValue,
          //   //elevation: 5,
          //   style: TextStyle(color: Colors.white),
          //   iconEnabledColor:Colors.black,
          //   items: <String>[
          //     'Android',
          //     'IOS',
          //     'Flutter',
          //     'Node',
          //     'Java',
          //     'Python',
          //     'PHP',
          //   ].map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //   value: value,
          //   child: Text(value,style:TextStyle(color:Colors.black),),
          //     );
          //   }).toList(),
          //   hint:Text(
          //     "How It works\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
          //     style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 14,
          //     fontWeight: FontWeight.w500),
          //   ),
            
          // ),
          //        ),
          //      ),
               SizedBox(height: 20.h,),
                Container(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              sendData();
                            },
                            child: Text("Request Send"),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff034047)),
                            ),
                )
              ),
              // SizedBox(height: 10.h,),
               
                
              ],
            ),
          ),
        ),

        
      ),
    );
  }
}