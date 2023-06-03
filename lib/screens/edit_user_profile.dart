import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/widgets/title3.dart';
import '../provider/provider1.dart';
import '../widgets/heading2.dart';
import '../widgets/labelsField.dart';
import '../widgets/title1.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  @override
  late bool _passwordVisible;
  late bool _passwordVisible2;
     void initState() {
    _passwordVisible = false;
    _passwordVisible2 = false;
    }
  @override

  bool _showPassword = false;
  bool _showPassword2 = false;
    final editfirst = TextEditingController();
    final editCnic = TextEditingController();
    final editmobile = TextEditingController();
  bool status=false;
   Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
   
final _formKey = GlobalKey<FormState>();
    
   
  Future pickProfileImage() async{
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.gallery);
      Provider11.localProfile = image!.path;
      
      final storageRef = FirebaseStorage.instance.ref("${Provider11.email}");
      File file = File(Provider11.localProfile .toString());
       setState(() {
          status=true;
        });
       try {
       
          await  storageRef.putFile(file);
        String downloadURL =  await storageRef.getDownloadURL();
        setState(() {
          Provider11.profile = downloadURL;
        });
       } catch (e) {
         print("${e}erorrrrr");
       }
        setState(() {
          status=false;
        });
    }

   Future  pickProfileImageCamera() async{
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.camera);
      Provider11.localProfile = image!.path;
      
      final storageRef = FirebaseStorage.instance.ref("${Provider11.email}");
      File file = File(Provider11.localProfile .toString());
       setState(() {
          status=true;
        });
       try {
          await  storageRef.putFile(file);
        String downloadURL =  await storageRef.getDownloadURL();
        setState(() {
          Provider11.profile = downloadURL;
        });
       } catch (e) {
         print("${e}erorrrrr");
       }
      setState(() {
          status=false;
        });
    }
    void Update() async{
       setState(() {
          status=true;
        });
      try {
        FirebaseFirestore db = FirebaseFirestore.instance;
       await db.collection("users").doc(Provider11.uid).update({
          "profile":Provider11.profile.toString(),
          "phone":editmobile.text,
          "cnic":editCnic.text,
          "fullname":editfirst.text
        });
Provider11.cnic=editCnic.text;
Provider11.phone=editmobile.text;
Provider11.fullname =editfirst.text;
         var data = await FirebaseFirestore.instance.
          collection("users").
          doc(Provider11.uid). 
          get();
   
          setState(() {
            Provider11.profile = data['profile'];
          });

          Fluttertoast.showToast(
          msg: "Your Data has been updated",
          toastLength: Toast.LENGTH_SHORT,

          
      );
     
      } on FirebaseAuthException  catch (e) {
         Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT,
      );
      }
       setState(() {
          status=false;
        });
    }
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xff034047),
            title: Text("My Profile"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () async{                                 
                  Navigator.of(context).pop();                     
                })
            
          ), 
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 200.h,
                width: double.infinity,
                 color: Color(0xffafc4dd),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Stack(
                    children: [
                       GestureDetector(
                        onTap: (){
                           showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title:   Text("From Camera or Gallery?"),
                          content: Container(
                            height: 150.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                                 Container(
                                          height: 50.h,
                                          
                                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child:ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xff164584),
                                                shape: RoundedRectangleBorder(                       
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                              ),
                                            child:  Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Camera"),
                                                SizedBox(width: 3.w,),
                                                Icon(Icons.camera)
                                              ],
                                            ),
                                            onPressed: () {
                                                 pickProfileImageCamera();
                                            },
                                          )
                                      ),
                                      SizedBox(height: 20.h,), 
                                      Container(
                                          height: 50.h,
                                        
                                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child:ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xff164584),
                                                shape: RoundedRectangleBorder(                       
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                              ),
                                            child:  Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Gallery"),
                                                SizedBox(width: 3.w,),
                                                Icon(Icons.image)
                                              ],
                                            ),
                                            onPressed: () {
                                                 pickProfileImage();
                                            },
                                          )
                                      ), 
                             ],
                            ),
                          ),
                          actions: <Widget>[
                            Container(
                                        height: 50,
                                        width: double.infinity,
                                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child:ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xff164584),
                                              shape: RoundedRectangleBorder(                       
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                            ),
                                          child:Text("Go Back"),
                                          onPressed: () {
                                               Navigator.of(ctx).pop();
                                          },
                                        )
                                    ), 
                          ],
                        ),
                      );
                        },
                         child: CircleAvatar(
                      radius: 75,
                      backgroundColor: Color(0xff2b578e),
                      child:CircleAvatar(  
                        radius: 70,
                        backgroundColor: Colors.white,
                        child:Container(
                          height: 140.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(Provider11.profile.toString()),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  
                     )],
                   ),
                    SizedBox(height: 7.h,),
                    Title1(heading: "${Provider11.fullname}", color: Colors.white)
                  ],
                 ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Padding(
                    padding:  EdgeInsets.only(top: 5.h),
                    child: SingleChildScrollView(
                      child:Form(
                  key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 10.h,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Labels(heading: "Full Name", color: Colors.black),
                                SizedBox(height: 5.h,),
                                TextFormField(
                                   validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Field is empty';
                                          }
                                          return null;
                                        },
                                  controller: editfirst,
                                  decoration: new InputDecoration(
                                      hintText: '${Provider11.fullname}',
                                      hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                      suffixIcon: Icon(Icons.person,color: Color(0xff034047),)
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Labels(heading: "Cnic no.", color: Colors.black),
                                SizedBox(height: 5.h,),
                                TextFormField(
                                   validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Field is empty';
                                          }
                                          return null;
                                        },
                                  keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(13),
                                ],
                                  controller: editCnic,
                                  decoration: new InputDecoration(
                                      hintText: '${Provider11.cnic}',
                                      hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                      suffixIcon: Icon(Icons.card_membership,color: Color(0xff034047),)
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Labels(heading: "Mobile no.", color: Colors.black),
                                SizedBox(height: 5.h,),
                                TextFormField(
                                   validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Field is empty';
                                          }
                                          return null;
                                        },
                                  keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(11),
                                ],
                                  controller: editmobile,
                                  decoration: new InputDecoration(
                                      hintText: '${Provider11.phone}',
                                      hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                      suffixIcon: Icon(Icons.phone,color: Color(0xff034047),)
                                  ),
                                ),
                              ],
                            ),
                                      
                            SizedBox(height: 5.h,),
                            Container(
                                    
                                      height: 50,
                                      width: double.infinity,
                                      padding: EdgeInsets.fromLTRB(50,2,50,2),
                                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff034047),
                            shape: RoundedRectangleBorder(                       
                              borderRadius: BorderRadius.circular(20), // <-- Radius
                            ),
                          ),
                        child:Title3(heading: "Update", color: Colors.white),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                             Update();
                          }
                          
                         
                        },
                                      )
                                  ),       
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          status==false?Container(): Align(
              alignment: Alignment.center,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Color(0xff034047).withOpacity(0.6),
                child: Center(
                  child: Container(
                    height: 120.h,
                    width: 120.w,
                     decoration: BoxDecoration(
                      color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(color: Color(0xff034047),width: 2)
                          ),
                    child: Stack(
                      children: [
                        
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                          height: 70.h,
                          width: 70.w,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(15.r),
                          //   border: Border.all(color: Colors.white,width: 2)
                          // ),
                          child:Image.asset('assets/images/logopng.png',height: 20.h,width: 20.w,)
                        ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 90.h,
                            width: 90.w,
                            child: CircularProgressIndicator(
                              
                              color: Color(0xff034047),),
                          )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
           
        ],
      ),
    );
  }
}


