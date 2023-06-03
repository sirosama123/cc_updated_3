import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/screens/terms.dart';
import 'package:vendorapp/screens/testing.dart';
import 'package:vendorapp/vendorSide/vendorHome.dart';
import 'package:vendorapp/widgets/callout.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';

import '../provider/provider1.dart';
import 'createAccount.dart';

class FixerSignin extends StatefulWidget {
  const FixerSignin({super.key});

  @override
  State<FixerSignin> createState() => _FixerSigninState();
}

class _FixerSigninState extends State<FixerSignin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  final _formKey = GlobalKey<FormState>();
  bool statee = false;
  String? uuid;
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
      getDataServices() async{
   FirebaseFirestore.instance
    .collection('works').doc(uuid).collection("sub")
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            Provider11.names.add(doc["name"]);
            Provider11.imgs.add(doc["imgAddress"].toString());
        });
    });
    await Future.delayed(const Duration(seconds: 5));
    print(Provider11.names);
  }
    void Login() async{
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;

      final Future<FirebaseApp> _initialization = Firebase.initializeApp();
      try {
        final UserCredential users = await auth.signInWithEmailAndPassword(
        email: email.text, password: password.text);

        setState(() {
          Provider11.uid = users.user!.uid;
          uuid =users.user!.uid;
          statee = false;
        });

         var data = await FirebaseFirestore.instance.
          collection("vendors").
          doc(users.user!.uid). 
          get();
          
  List<String> list = [];
  var querySnapshot = await FirebaseFirestore.instance.collection('works').doc(uuid).collection("sub").get();
  querySnapshot.docs.forEach((document) {
    var field = document.get('name');
    list.add(field);
  });
  print(list);
      setState(() {
            Provider11.fullname=data['fullname'];
            Provider11.gender=data['gender'];
            Provider11.email=data['email'];
            Provider11.address = data['address'];
            Provider11.cnic = data['cnic'];
            Provider11.dob = data['dob'];
            Provider11.uid = data['uid'];
            Provider11.shop_address = data['shop_address'];
            Provider11.total_experience = data['total_experience'];
            Provider11.phone = data['phone'];
            Provider11.experience_description = data['experience_description'];
            Provider11.latitude = data['latitude'].toString();
            Provider11.longitude = data['longitude'].toString();
            Provider11.profile = data['profile'];
            Provider11.FrontFaceurl = data['FrontImg'];
            Provider11.LeftFaceurl = data['LeftImg'];
            Provider11.RightFaceurl = data['RightImg'];
            Provider11.tasks=list;
          });
          setState(() {
            statee = false;
          });
         
        //  await getDataServices();
         Navigator.pushNamed(context, '/vendorHome');
     
      } 
        on FirebaseAuthException catch(e) {
        print(e);
        Fluttertoast.showToast(
          msg: "${e.message}",
          toastLength: Toast.LENGTH_SHORT,
      );
      }
    }  
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffc6d8e2),
        body: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 35.h),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
            
            
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Heading(heading: "Fixer Log in")),
                     
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Labels(heading: "Email", color: Color(0xff034047)),
                      Container(
                        child: TextFormField(
                          controller: email,
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
                              Icons.email,
                              color: Color(0xff034047) ,
                            ),
                            prefixIconColor: Color(0xff034047)
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Labels(heading: "Password", color: Color(0xff034047)),
                      Container(
                        child: TextFormField(
                          controller: password,
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
                              Icons.password,
                              color: Color(0xff034047) ,
                            ),
                            prefixIconColor: Color(0xff034047)
                          ),
                        ),
                      ),
                    ],
                  ),
                 
                 
                  SizedBox(height: 10.h,),
                  statee==false?Container(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Login();
                                // Navigator.push(
                                // context,
                                // MaterialPageRoute(builder: (context) => Terms()),);
                              }
                              
                            },
                            child: Text("Log in"),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff034047)),
                            ),
                          )):Center(child: CircularProgressIndicator(color: Colors.white,),),
                    SizedBox(height: 10.h,),  
                    Container(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                            
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CreateAccount()),);
                            
                              
                            },
                            child: Text("Create an Account"),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff034047)),
                            ),
                          ))
                ],
              ),
            ),
          ),
        ) ,
      ),
    );
  }
}