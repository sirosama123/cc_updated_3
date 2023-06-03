import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/widgets/title3.dart';
import '../provider/provider1.dart';
import '../widgets/heading2.dart';
import '../widgets/labelsField.dart';
import '../widgets/title1.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
    final oldPassword = TextEditingController();
    final newPassword = TextEditingController();
    final editmobile = TextEditingController();

   Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
   

    

    String profimagePath ="";
 
   Future pickProfileImage() async{
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.gallery);
      Provider11.profile = image!.path;
      
      final storageRef = FirebaseStorage.instance.ref("${Provider11.email}");
      File file = File(Provider11.profile .toString());
       try {
          await  storageRef.putFile(file);
        String downloadURL =  await storageRef.getDownloadURL();
        setState(() {
          Provider11.profile = downloadURL;
        });
       } catch (e) {
         print("${e}erorrrrr");
       }

    }

   Future  pickProfileImageCamera() async{
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.camera);
      Provider11.profile = image!.path;
      
      final storageRef = FirebaseStorage.instance.ref("${Provider11.email}");
      File file = File(Provider11.profile .toString());
       try {
          await  storageRef.putFile(file);
        String downloadURL =  await storageRef.getDownloadURL();
        setState(() {
          // Provider11.ProfileImagePath = downloadURL;
        });
       } catch (e) {
         print("${e}erorrrrr");
       }
     
    }
    void Update() async{
      try {
        FirebaseFirestore db = FirebaseFirestore.instance;
        db.collection("users").doc(Provider11.uid).update({
          "firstname":editfirst.text,
          "lastname":oldPassword.text,
          "phone":editmobile.text,
          // "profile":Provider11.ProfileImagePath.toString()

        });

         var data = await FirebaseFirestore.instance.
          collection("users").
          doc(Provider11.uid). 
          get();
   
          setState(() {
            // Provider11.first=data['firstname'];
            // Provider11.last=data['lastname'];
            // Provider11.email=data['email'];
            // Provider11.uuid = data['uid'];
            // Provider11.number = data['phone'];
            // Provider11.gen = data['gender'];
            // Provider11.ProfileImagePath = data['profile'];
            // Provider11.number = data['phone'];
           
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
    }

    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xff2b578e),
            title: Text("My Profile"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () async{                                 
                  Navigator.of(context).pop();                     
                })
            
          ), 
      body: ListView(
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
                  title:  Title3(heading: "From Camera or Gallery?", color: Colors.black),
                  content: Container(
                    height: 150.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                         Container(
                                  height: 50.h,
                                  width: 120.w,
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child:ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff034047),
                                        shape: RoundedRectangleBorder(                       
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    child:  Row(
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
                                  width: 120.w,
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child:ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff034047),
                                        shape: RoundedRectangleBorder(                       
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    child:  Row(
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
                                    backgroundColor: Color(0xff034047),
                                      shape: RoundedRectangleBorder(                       
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  child:  Title1(heading: "Go back", color: Colors.white),
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
                  child: Column(
                    children: [
                      SizedBox(height: 10.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labels(heading: "Full Name", color: Colors.black),
                          SizedBox(height: 5.h,),
                          TextField(
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
                          Labels(heading: "Old Password", color: Colors.black),
                          SizedBox(height: 5.h,),
                          TextField(
                           obscureText: !this._showPassword,
                            controller: oldPassword,
                            decoration:  InputDecoration(
                                hintText: '${Provider11.fullname}',
                                hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: this._showPassword ? Color(0xff034047) : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() => this._showPassword = !this._showPassword);
                          },
                      ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labels(heading: "New Password", color: Colors.black),
                          SizedBox(height: 5.h,),
                          TextField(
                           obscureText: !this._showPassword2,
                            controller: newPassword,
                            decoration:  InputDecoration(
                                hintText: '${Provider11.fullname}',
                                hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: this._showPassword2 ? Color(0xff034047) : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() => this._showPassword2 = !this._showPassword2);
                          },
                      ),
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
                          TextField(
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
                     Update();
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),);
                  },
                                )
                            ),       
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


