import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/screens/terms.dart';
import 'package:vendorapp/screens/testing.dart';
import 'package:vendorapp/vendorSide/numberAdd.dart';
import 'package:vendorapp/vendorSide/serviceSelection.dart';
import 'package:vendorapp/widgets/callout.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';

import '../provider/provider1.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController address = TextEditingController();
  String? _selectedGender = "male";
  String? dob;
  final _formKey = GlobalKey<FormState>();
  late bool _passwordVisible;
  void initState() {
    _passwordVisible = false;
  }
  bool status= false;
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
        final Provider11 = Provider.of<Provider1>(context); 
    createAccount() async {
      try {
        setState(() {
          status=true;
        });
        FirebaseAuth auth = FirebaseAuth.instance;
        FirebaseFirestore db = FirebaseFirestore.instance;
        final UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        Provider11.uid=user.user!.uid;
        db.collection("vendors").doc(user.user!.uid).set({
          "fullname": fullname.text,
          "email": email.text,
          "uid": user.user!.uid,
          "phone": phone.text,
          "gender": _selectedGender,
          "cnic": cnic.text,
          "address": address.text,
          "dob": dob.toString(),
          "rating":1,
          "profile": "https://cdn-icons-png.flaticon.com/512/1077/1077012.png"
        });
      await  FirebaseDatabase.instance.ref('vendors/${Provider11.uid}').set({
        "amount":"0"
      });
        setState(() {
          status=false;
        });
         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServiceSelection()),
                          );
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(
          msg: "${e.message}",
          toastLength: Toast.LENGTH_SHORT,
        );
        setState(() {
          status=false;
        });
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffc6d8e2),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 35.h),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Heading(heading: "Let's Create Account")),
                      SizedBox(
                        height: 15.h,
                      ),
                      Labels(heading: "Full Name", color: Color(0xff034047)),
                      Container(
                        child: TextFormField(
                          controller: fullname,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Field is empty';
                            }
                            return null;
                          },
                          style: TextStyle(color: Color(0xff034047)),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff034047)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff034047)),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xff034047),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Labels(heading: "Email", color: Color(0xff034047)),
                      Container(
                        child: TextFormField(
                          controller: email,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Field is empty';
                            }
                            return null;
                          },
                          style: TextStyle(color: Color(0xff034047)),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff034047)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff034047)),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xff034047),
                              ),
                              prefixIconColor: Color(0xff034047)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Labels(heading: "Password", color: Color(0xff034047)),
                      Container(
                        child: TextFormField(
                          controller: password,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Field is empty';
                            }
                            return null;
                          },
                          style: TextStyle(color: Color(0xff034047)),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff034047)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff034047)),
                              ),
                              prefixIcon: Icon(
                                Icons.key,
                                color: Color(0xff034047),
                              ),
                              prefixIconColor: Color(0xff034047)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Labels(
                              heading: "Date Of Birth:",
                              color: Color(0xff034047)),
                          Container()
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime(1998),
                              firstDate: DateTime(1960),
                              lastDate: DateTime(2010));
                          setState(() {
                            dob = newDate.toString();
                          });
                          print(dob);
                        },
                        child: Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/date.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Labels(
                          heading: "Please let us know your gender:",
                          color: Color(0xff034047)),
                      ListTile(
                        leading: Radio<String>(
                          activeColor: Color(0xff034047),
                          value: 'male',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('Male'),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          activeColor: Color(0xff034047),
                          value: 'female',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('Female'),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Labels(heading: "Phone Number", color: Color(0xff034047)),
                      Container(
                        child: TextFormField(
                          controller: phone,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11),
                          ],
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Field is empty';
                            }
                            return null;
                          },
                          style: TextStyle(color: Color(0xff034047)),
                          decoration: InputDecoration(
                              hintText: "xxxxxxxxxxx",
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff034047)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff034047)),
                              ),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Color(0xff034047),
                              ),
                              prefixIconColor: Color(0xff034047)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Labels(heading: "CNIC", color: Color(0xff034047)),
                      Container(
                        child: TextFormField(
                          controller: cnic,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(13),
                          ],
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Field is empty';
                            }
                            return null;
                          },
                          style: TextStyle(color: Color(0xff034047)),
                          decoration: InputDecoration(
                              hintText: "xxxxxxxxxxxxx",
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff034047)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff034047)),
                              ),
                              prefixIcon: Icon(
                                Icons.card_giftcard,
                                color: Color(0xff034047),
                              ),
                              prefixIconColor: Color(0xff034047)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Labels(heading: "Address", color: Color(0xff034047)),
                      Container(
                        child: TextFormField(
                          controller: address,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Field is empty';
                            }
                            return null;
                          },
                          style: TextStyle(color: Color(0xff034047)),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff034047)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff034047)),
                              ),
                              prefixIcon: Icon(
                                Icons.home,
                                color: Color(0xff034047),
                              ),
                              prefixIconColor: Color(0xff034047)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  status==false?Container(
                      height: 48.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: ()async {
                          if (_formKey.currentState!.validate() && dob != "") {
                            await createAccount();
                             Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NumberAdd()),
                          );
                     
                          }

                                  
                        
                        },
                        child: Text("Create Account"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff034047)),
                        ),
                      )):Container(
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.black,),
                        ),
                      ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
