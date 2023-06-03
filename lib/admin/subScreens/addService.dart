import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tap_to_expand/tap_to_expand.dart';
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

import '../../widgets/title4.dart';
import '../../widgets/titleTune.dart';
import '../widgets/serviceListView.dart';
import 'dart:async';
import 'dart:io';


class AddNewServiceAdmin extends StatefulWidget {
  String? category;
  AddNewServiceAdmin({super.key,required this.category});

  @override
  State<AddNewServiceAdmin> createState() => _AddNewServiceAdminState();
}

class _AddNewServiceAdminState extends State<AddNewServiceAdmin> {
  final _formKey = GlobalKey<FormState>();
  @override
  TextEditingController serviceName = TextEditingController();
String? imgPath;
  Widget build(BuildContext context) {
    
    void pickImageGallery() async{
      
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.gallery);  
      // Provider11.imagePath = image!.path;  
      setState(() {
        imgPath = image!.path;
      });
      showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Do you want to upload?"),
                 
                  actions: <Widget>[
                    TextButton(
                     onPressed: () {
                        setState(() {
                          imgPath = image!.path;
                        });
                        print(imgPath);
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
                          imgPath = null;
                        
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

       
        sendData()async{
         try {
          
          print("${imgPath} here is path");
            FirebaseFirestore db = FirebaseFirestore.instance;
          final storageRef = FirebaseStorage.instance.ref("${imgPath}"+".jpg");
          File file = File(imgPath.toString());
          await  storageRef.putFile(file);
          print("File Uploaded Successfully profile");
          String downloadURL =  await storageRef.getDownloadURL();
          CollectionReference ser = FirebaseFirestore.instance.collection('services');
          await ser
              .doc("Ao19VKeJIAD7kpgTCfkH")
              .update({'${widget.category}.${serviceName.text}': {'img': '$downloadURL','name':'${serviceName.text}','nature':'network'}});
                    print(downloadURL);
          print("added");
           showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Service is added"),
                 
                  actions: <Widget>[
                  
                    TextButton(
                       onPressed: (){
                
                        Navigator.of(ctx).pop();
                },
                      child: Container(
                        color: Color(0xff2b578e),
                        padding: const EdgeInsets.all(14),
                        child: const Text("ok",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              );
         } catch (e) {
           print("${e} error is here");
         }
        }


    return Scaffold(
       appBar: AppBar(
        title: TitleTune(heading: "Add New Service Name", color: Colors.white, weight: FontWeight.bold, size: 21),
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
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                TitleTune(heading: "Please write the name of Service:", color: Color(0xff034047), weight: FontWeight.bold, size: 12),
                SizedBox(height: 5.h,),
                Container(
                              child: TextFormField(
                                controller: serviceName,
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
                                    CupertinoIcons.briefcase,
                                    color: Color(0xff034047) ,
                                  ),
                                  prefixIconColor: Color(0xff034047)
                                ),
                                 validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                              ),
                            ),
                SizedBox(height: 10.h,),
                TitleTune(heading: "Please add image of Service:", color: Color(0xff034047), weight: FontWeight.bold, size: 12),
                SizedBox(height: 5.h,),
                GestureDetector(
                  onTap: (){
                    pickImageGallery();
                  },
                  child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                                          child: Container(
                                            height: 30.h,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0xff034047),
                                              borderRadius: BorderRadius.circular(5.r),
                                            ),
                                            child: Center(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Title4(
                                                  color: Colors.white,
                                                  heading: 'Add Image',
                                                  weight: FontWeight.bold,
                                                ),
                                                Icon(
                                                  Icons.image,
                                                  color: Colors.white,
                                                  size: 20,
                                                )
                                              ],
                                            )),
                                          ),
                                        ),
                ),
                         SizedBox(
                        height: 10.h,
                      ),
                     Container(
                                      height: 48.h,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: ()async {
                                           
                                          if (_formKey.currentState!.validate()) {
                                         sendData();
                                  //          await Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => WhenWhere()),
                                  // );
                                          }
                                        },
                                        child: Text("Add Service"),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(Color(0xff034047)),
                                        ),
                                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}