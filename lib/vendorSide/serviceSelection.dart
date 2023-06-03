import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/vendorSide/servicetype.dart';
import 'package:vendorapp/vendorSide/uploadProfile.dart';
import 'package:vendorapp/vendorSide/verifyNumber.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/link.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';

import '../provider/provider1.dart';


class ServiceSelection extends StatefulWidget {
  const ServiceSelection({super.key});

  @override
  State<ServiceSelection> createState() => _ServiceSelectionState();
}

class _ServiceSelectionState extends State<ServiceSelection> {
  final passport = TextEditingController();
  String? imagePath;
  String? front;
  String? left;
  String? right;
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    FirebaseFirestore db = FirebaseFirestore.instance;

    getLinkFront()async{
        FirebaseFirestore db = FirebaseFirestore.instance;
        final storageRef = FirebaseStorage.instance.ref("${Provider11.uid}front"+".jpg");
        File file = File(Provider11.imagePath.toString());
        await  storageRef.putFile(file);
        print("File Uploaded Successfully front");
        String downloadURL =  await storageRef.getDownloadURL();
        Provider11.FrontFaceurl = downloadURL;
       await db.collection("vendors").doc(Provider11.uid).update({
          "FrontImg":downloadURL
        });
        setState(() {
          front= downloadURL;
        });
      }
       getLinkLeft()async{
        FirebaseFirestore db = FirebaseFirestore.instance;
        final storageRef = FirebaseStorage.instance.ref("${Provider11.uid}left"+".jpg");
        File file = File(Provider11.imagePath.toString());
        await  storageRef.putFile(file);
        print("File Uploaded Successfully left");
        String downloadURL =  await storageRef.getDownloadURL();
        Provider11.LeftFaceurl = downloadURL;
       await db.collection("vendors").doc(Provider11.uid).update({
          "LeftImg":downloadURL
        });
        setState(() {
          left= downloadURL;
        });
      }
       getLinkRight()async{
        FirebaseFirestore db = FirebaseFirestore.instance;
        final storageRef = FirebaseStorage.instance.ref("${Provider11.uid}right"+".jpg");
        File file = File(Provider11.imagePath.toString());
        await  storageRef.putFile(file);
        print("File Uploaded Successfully right");
        String downloadURL =  await storageRef.getDownloadURL();
        Provider11.RightFaceurl = downloadURL;
        await  db.collection("vendors").doc(Provider11.uid).update({
          "RightImg":downloadURL
        });
        setState(() {
          right= downloadURL;
        });
      }

   

     void pickImageCamera(String sidee) async{
      
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.camera);
      Provider11.imagePath = image!.path;
       setState(() {
        imagePath = image.path;
      });
      
      showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Do you want to upload this Precsription?"),
                  actions: <Widget>[
                    TextButton(
                     onPressed: () {
                        setState(() {
                          Provider11.imagePath = image.path;
                        });
                        if (sidee=="Front") {
                          getLinkFront();
                        } else if(sidee=="Left") {
                          getLinkLeft();
                        }
                        else if(sidee=="Right") {
                          getLinkRight();
                        }
                        Navigator.of(ctx).pop();},
                      child: Container(
                        color: Color(0xff2b578e),
                        padding: const EdgeInsets.all(14),
                        child: const Text("Yes",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    TextButton(
                       onPressed: (){
                  setState(() {
                          imagePath = null;
                          Provider11.imagePath = null;
                        });
                        Navigator.of(ctx).pop();
                },
                      child: Container(
                        color: Color(0xff2b578e),
                        padding: const EdgeInsets.all(14),
                        child: const Text("No",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              );

    }
     void pickImageGallery(String sidee) async{
      
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.gallery);  
      Provider11.imagePath = image!.path;  
      setState(() {
        imagePath = image.path;
      });
      showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Do you want to upload this Precsription?"),
                  content: Image.asset(image.path),
                  actions: <Widget>[
                    TextButton(
                     onPressed: () {
                        setState(() {
                          Provider11.imagePath = image.path;
                        });
                         if (sidee=="Front") {
                          getLinkFront();
                        } else if(sidee=="Left") {
                          getLinkLeft();
                        }
                        else if(sidee=="Right") {
                          getLinkRight();
                        }
                        Navigator.of(ctx).pop();},
                      child: Container(
                        color: Color(0xff2b578e),
                        padding: const EdgeInsets.all(14),
                        child: const Text("Yes",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    TextButton(
                       onPressed: (){
                  setState(() {
                          imagePath = null;
                          Provider11.imagePath = null;
                        });
                        Navigator.of(ctx).pop();
                },
                      child: Container(
                        color: Color(0xff2b578e),
                        padding: const EdgeInsets.all(14),
                        child: const Text("No",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              );
            
       }

    side(String sidee){
       Dialogs.bottomMaterialDialog(
          msg: 'Select From where you want..',
          title: "${sidee} Picture",
          color: Colors.white,
          context: context,
          actions: [
           IconsButton(
              onPressed: () {
                pickImageGallery(sidee);
              },
              text: 'Gallery',
              iconData: Icons.picture_in_picture,
              color: Color(0xff034047),
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
            IconsButton(
              onPressed: () {
                pickImageCamera(sidee);
              },
              text: 'Camera',
              iconData: Icons.camera,
              color: Color(0xff034047),
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]);
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [   
                           Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/logo2.jpg'),
                                  fit: BoxFit.fill,
                              ),
                                )
                          ),
                          SizedBox(width: 15.w,),
                          Title3(heading: "Services Selection &\nID Verification",color:Color(0xff034047) ,),              
                        ],
                ),
          
            SizedBox(height: 30.h,),
            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Labels(heading: "Passport No.", color: Color(0xff034047)),
                              SizedBox(height: 5.h,),
                              Container(
                                height:35.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 20.w),
                                  child: TextFormField(
                                  controller:passport ,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                  // for below version 2 use this
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
                              // for version 2 and greater youcan also use this
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(2),
            
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                      enabledBorder: null,
                                        focusedBorder: null,
                                    hintText: "your passport no",
                                  )
                              ),
                                )
                              ),
                            ],
                          ),
            SizedBox(height: 30.h,),
            Labels(heading: "Upload Front Passport Size Image", color: Color(0xff034047)),
            SizedBox(height: 10.h,),
            GestureDetector(
              onTap: (){
               
              side("Front");
              },
              child:front==null? Container(
                height: 120.h,
                width: 120.w,
                decoration:BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                    'assets/images/personadd.png'),
                fit: BoxFit.fill,
              ),
                ) ,
              ):Container(
                height: 120.h,
                width: 120.w,
                decoration:BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    '$front'),
                fit: BoxFit.fill,
              ),
                ) ,
              ),
            ),
             SizedBox(height: 30.h,),
            Labels(heading: "Upload Leftside face Image", color: Color(0xff034047)),
            SizedBox(height: 10.h,),
            GestureDetector(
                onTap: (){
               
              side("Left");
              },
              child: left==null? Container(
                height: 120.h,
                width: 120.w,
                decoration:BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                    'assets/images/personadd.png'),
                fit: BoxFit.fill,
              ),
                ) ,
              ):Container(
                height: 120.h,
                width: 120.w,
                decoration:BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    '$left'),
                fit: BoxFit.fill,
              ),
                ) ,
              ),
            ),
               SizedBox(height: 30.h,),
            Labels(heading: "Upload Rightside face Image", color: Color(0xff034047)),
            SizedBox(height: 10.h,),
            GestureDetector(
                onTap: (){
               
              side("Right");
              },
              child:right==null? Container(
                height: 120.h,
                width: 120.w,
                decoration:BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                    'assets/images/personadd.png'),
                fit: BoxFit.fill,
              ),
                ) ,
              ):Container(
                height: 120.h,
                width: 120.w,
                decoration:BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    '$right'),
                fit: BoxFit.fill,
              ),
                ) ,
              ),
            ),
             SizedBox(height: 30.h,),
                Container(
                  height: 48.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                     if (front!=null&&left!=null&&right!=null) {
                         Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UploadProfilePic()),);
                     } else {
                       Fluttertoast.showToast(
        msg: "Please Provide all Info",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
                     }
                    },
                    child: Text("Next"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff034047)),
                    ),
                  )),
            ],
                ),
          ),
        ),
      )
    );
  }
}





