
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Provider1 extends ChangeNotifier {
  String? imagePath;
  String? FrontFaceurl;
  String? RightFaceurl;
  String? LeftFaceurl;
  String uid = 'Y6YIO44n9LRqHWmb1ONZcrpRqFs1';
  double? lat;
  double? lon;
  String? address;
  List<dynamic> works =[];
  String? cnic;
  String? dob;
  String? email;
  String? fullname;
  String? gender;
  String? phone;
  String? profile;
  String? shop_address;
  String? total_experience;
  String? latitude;
  String? longitude;
  String? experience_description;

  String? tasktitle;
  String? taskdetail;
  String? taskaudio;
  String? taskvideo;
  String? taskName;
  String? pm;

  String? taskdate;
  String? taskwhere;

  String? taskbudget;

  String paymentMethod = "cod";

  List<dynamic> names =[];
  List<dynamic> imgs =[];
  List<String>? tasks ;

  String? localProfile;


  notifyListeners();
}

