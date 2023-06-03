import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/labelsField.dart';
import '../../../widgets/titleTune.dart';
import 'dart:async';
import 'dart:io';


class BannersUpdate extends StatefulWidget {
  String? app;
  BannersUpdate({super.key,required this.app});

  @override
  State<BannersUpdate> createState() => _BannersUpdateState();
}

class _BannersUpdateState extends State<BannersUpdate> {
  @override

  Widget build(BuildContext context) {
    final stream1 =FirebaseFirestore.instance.collection('banners').snapshots();
    final stream2 =FirebaseFirestore.instance.collection('banners');
      final _formKey = GlobalKey<FormState>();
    TextEditingController link = TextEditingController();
    String? imgPath;

      sendData()async{
         try {
          
          print("${imgPath} here is path");
            FirebaseFirestore db = FirebaseFirestore.instance;
          final storageRef = FirebaseStorage.instance.ref("${imgPath}"+".jpg");
          File file = File(imgPath.toString());
          await  storageRef.putFile(file);
          print("File Uploaded Successfully profile");
          String downloadURL =  await storageRef.getDownloadURL();
           stream2.doc("X8xwi93SqrXE8ZeEoh5g").update(
                                          {'${widget.app}': FieldValue.arrayUnion([downloadURL]),}
                                         );
                                           
                    print(downloadURL);
          print("added");
         } catch (e) {
           print("${e} error is here");
         }
        }
     void pickImage() async{
      
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.gallery);  
      // Provider11.imagePath = image!.path;  
      setState(() {
        imgPath = image!.path;
      });
       sendData();  
       }


       
      


        updateImg(){
          showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Add Link or upload image?"),
                  content: Container(
                    height: 100.h,
                    child: Column(
                      children: [
                         Labels(heading: "Add Link", color: Color(0xff034047)),
                        Form(
                          key: _formKey,
                          child: Container(
                            child: TextFormField(
                              validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Field is empty';
                              }
                              return null;
                            },
                              controller: link,
                              style: TextStyle(color: Color(0xff034047)),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff034047)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff034047)),
                                ),
                                prefixIcon: Icon(
                                  Icons.link,
                                  color: Color(0xff034047),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                     onPressed: () async{
                        pickImage();
                        Navigator.of(ctx).pop();
                        },
                      child: Container(
                        color: Color(0xff034047),
                        padding: const EdgeInsets.all(14),
                        child: const Text("From Gallery",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    TextButton(
                       onPressed: (){
                        
                        if (_formKey.currentState!.validate()) {
                                stream2.doc("X8xwi93SqrXE8ZeEoh5g").update(
                                          {'${widget.app}': FieldValue.arrayUnion([link.text]),}
                                         );
                        Navigator.of(ctx).pop();
                        }
                },
                      child: Container(
                        color: Color(0xff034047),
                        padding: const EdgeInsets.all(14),
                        child: const Text("Add Link",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              );
        }

    return Scaffold(
       appBar: AppBar(
        title: TitleTune(heading: "Update Banners", color: Colors.white, weight: FontWeight.bold, size: 21),
        actions: [
           Container(
                                          height: 30.h,
                                          width: 120.w,
                                          child: ElevatedButton(
                                            onPressed: ()async {
                                               
                                            updateImg();
                                              
                                            },
                                            child: Text("Add New"),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(Color(0xff034047)),
                                            ),
                                          )),
        ],
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
      body: StreamBuilder<QuerySnapshot>(
        stream: stream1,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          return ListView.builder(
            
            itemCount: documents.length,
            itemBuilder: (context, index) {
              return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: documents[index]['${widget.app}'].length,
                itemBuilder: (context,ind){
                  return Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TitleTune(heading: "${ind+1}", color: Color(0xff034047), weight: FontWeight.bold, size: 14),
                                           Container(
                                            height: 30.h,
                                            width: 80.w,
                                            child: ElevatedButton(
                                              onPressed: ()async {
                                                 print("object");
                                           stream2.doc("X8xwi93SqrXE8ZeEoh5g").update(
                                            {'${widget.app}': FieldValue.arrayRemove([documents[index]['${widget.app}'][ind]]),}
                                           );
                                                
                                              },
                                              child: Text("Delete"),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(Color(0xff034047)),
                                              ),
                                            ))
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Padding(
                        padding:EdgeInsets.all(10),
                        child: Container(
                          height: 140.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image: NetworkImage(documents[index]['${widget.app}'][ind]),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                      )
                    ],
                  );
                  Text(documents[index]['userapp'][ind]);
                }
                );
            },
          );
        },
      ),
    );
  }
}
