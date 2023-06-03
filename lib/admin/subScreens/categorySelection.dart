import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'addService.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot> _categoryStream = FirebaseFirestore.instance
        .collection('services')
        .doc("Ao19VKeJIAD7kpgTCfkH")
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        title: TitleTune(
            heading: "Select Category",
            color: Colors.white,
            weight: FontWeight.bold,
            size: 21),
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
      body: StreamBuilder<DocumentSnapshot>(
          stream: _categoryStream,
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            Map<String, dynamic>? userData =
                snapshot.data!.data()! as Map<String, dynamic>;
            // Access the user data using userData['FIELD_NAME']
            return Padding(
              padding:  EdgeInsets.only(top: 10.h),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10, // Spacing between columns
                  mainAxisSpacing: 10, // Spacing between rows
                ),
                itemCount: userData.keys.toList().length, // Number of items in the grid
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewServiceAdmin(category: "${userData.keys.toList()[index]}",)));
                        },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10.r)
                      ),
                      child: Center(
                        child: TitleTune(
                          heading: "${userData.keys.toList()[index]}", 
                          color: Colors.white, weight: FontWeight.bold, size: 12)
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}

class AddCategoryAdmin extends StatelessWidget {
  const AddCategoryAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController categoryName = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: TitleTune(
            heading: "Add New Category",
            color: Colors.white,
            weight: FontWeight.bold,
            size: 21),
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
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleTune(heading: "Please write the name of your category:", color: Color(0xff034047), weight: FontWeight.bold, size: 12),
            Container(
                          child: TextFormField(
                            controller: categoryName,
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
                         SizedBox(height: 20.h,),
                    Container(
                                  height: 30.h,
                                  width: 140.w,
                                  child: ElevatedButton(
                                    onPressed: () async{
                                     
                                      if (_formKey.currentState!.validate()) {
                                          Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>AddNewServiceAdmin(category: "${categoryName.text}",) ),);
                                      }
                                     
                                   
                                    },
                                    child: Text("Add Category"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Color(0xff034047)),
                                    ),
                                  ))
          ],
        ),
      ),
    );
  }
}