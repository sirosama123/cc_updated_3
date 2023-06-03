import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/vendorSide/servicetype.dart';
import 'package:vendorapp/vendorSide/typeOfService.dart';
import 'package:vendorapp/vendorSide/verifyNumber.dart';
import 'package:vendorapp/vendorSide/workexperience.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/link.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'dart:async';
import 'dart:io';

import '../provider/provider1.dart';


class UploadProfilePic extends StatefulWidget {
  const UploadProfilePic({super.key});

  @override
  State<UploadProfilePic> createState() => _UploadProfilePicState();
}

class _UploadProfilePicState extends State<UploadProfilePic> {
  @override
  String? imagePath;
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    FirebaseFirestore db = FirebaseFirestore.instance;

         getLink()async{
        FirebaseFirestore db = FirebaseFirestore.instance;
        final storageRef = FirebaseStorage.instance.ref("${Provider11.uid}profile"+".jpg");
        File file = File(Provider11.imagePath.toString());
        await  storageRef.putFile(file);
        print("File Uploaded Successfully profile");
        String downloadURL =  await storageRef.getDownloadURL();
        Provider11.FrontFaceurl = downloadURL;
       await db.collection("vendors").doc(Provider11.uid).update({
          "profile":downloadURL
        });
        setState(() {
          imagePath=downloadURL;
        });
      }

      void pickImageCamera() async{
      
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.camera);
      Provider11.imagePath = image!.path;
       setState(() {
        imagePath = image.path;
      });
      
      showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Do you want to upload this Image?"),
                  actions: <Widget>[
                    TextButton(
                     onPressed: () {
                        setState(() {
                          Provider11.imagePath = image.path;
                        });
                         getLink();
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
     void pickImageGallery() async{
      
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


    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                        height: 70.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo3.png'),
                            fit: BoxFit.fill,
                          ),
                        )),
                    SizedBox(width: 10.w,),
                    Heading(heading: "Profile Picture"),
          
                  ],
                ),
              SizedBox(height: 10.h,),
              Description(description: "Capture a photo/selfie and submit to complete the onboarding process"),
              SizedBox(height: 30.h,),
              CircleAvatar(
                radius: 70.r,
                backgroundColor: Colors.blue,
                child: imagePath==null? CircleAvatar(
                  radius: 65.r,
                  backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/1077/1077012.png"),
                ):CircleAvatar(
                  radius: 65.r,
                  backgroundImage: NetworkImage("$imagePath"),
                ),
              ),
              SizedBox(height: 30.h,),
             imagePath==null? Container(
                            height: 48.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r)
                            ),
                            child: ElevatedButton(
                              onPressed: ()async {
                                // if (_formKey.currentState!.validate() && dob != "") {
                                //   await createAccount();
                           
                                // }
          
                                //          Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => NumberAdd()),
                                // );
                              Profile();
                              },
                              child: Title3(heading: "Add Profile Image ", color: Color(0xff034047)),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                    
                              ),
                            )):Container(
                            height: 48.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r)
                            ),
                            child: ElevatedButton(
                              onPressed: ()async {
                                // if (_formKey.currentState!.validate() && dob != "") {
                                //   await createAccount();
                           
                                // }
          
                                         Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WorkExperience()),
                                 );
                              },
                              child: Title3(heading: "Next ", color: Color(0xff034047)),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                    
                              ),
                            ))
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}