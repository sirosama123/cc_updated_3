import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendorapp/admin/subScreens/banners.dart';
import 'package:vendorapp/admin/subScreens/bookingHistory.dart';
import 'package:vendorapp/admin/subScreens/complians.dart';
import 'package:vendorapp/admin/subScreens/reviews.dart';
import 'package:vendorapp/admin/subScreens/serviceslist.dart';
import 'package:vendorapp/admin/subScreens/surveys.dart';
import 'package:vendorapp/admin/subScreens/usersList.dart';
import 'package:vendorapp/widgets/dashboardSquare.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:vendorapp/widgets/jobs.dart';
import 'package:vendorapp/widgets/sqDB2.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/title5.dart';
import 'package:vendorapp/widgets/wideSquaresDb.dart';

import '../screens/reviewsLista.dart';
import 'app_rating.dart';
import 'widgets/adminTabs.dart';

class AdminHomeM extends StatefulWidget {
  const AdminHomeM({super.key});

  @override
  State<AdminHomeM> createState() => _AdminHomeMState();
}

class _AdminHomeMState extends State<AdminHomeM> {
  @override
  List<String>? vendor;
  List<String>? user;
  getdata() async {
    await FirebaseFirestore.instance
        .collection("banners")
        .doc('X8xwi93SqrXE8ZeEoh5g')
        .get()
        .then((value) {
        setState(() {
           vendor = List.from(value.data()!['vendorapp']);
         user = List.from(value.data()!['userapp']);
        });
                    
    });
      Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => BannersAdmin(userimgs: user!.toList(), vendorimgs: vendor!.toList(),)),
                                  );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Heading2(heading: "Admin Portal", color: Colors.black),
                  Container()
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UsersListAdmin()),
                        );
                      },
                      child: TabsAdmin(
                          img1: "assets/images/people.png",
                          tabName: "Users/Vendors")),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ServicesList()),
                      );
                    },
                    child: TabsAdmin(
                        img1: "assets/images/services.png",
                        tabName: "Services"),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>AdminReviewLists()
                        //  ReviewLists()
                         ),
                      );
                    },
                    child: TabsAdmin(
                        img1: "assets/images/review.png", tabName: "Reviews"),
                  ),
                  GestureDetector(
                    onTap: () {
                      getdata();
                    },
                    child: TabsAdmin(
                        img1: "assets/images/banner.png", tabName: "Banners"),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookingHistory()),
                      );
                    },
                    child: TabsAdmin(
                        img1: "assets/images/hist.png",
                        tabName: "Booking History"),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Complains()));
                    },
                    child: TabsAdmin(
                        img1: "assets/images/complains.png",
                        tabName: "Complains"),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Surveys()),
                      );
                    },
                    child: TabsAdmin(
                        img1: "assets/images/checklist.png",
                        tabName: "Surveys"),
                  ),
                   GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AppRating()),
                      );
                    },
                    child: TabsAdmin(
                        img1: "assets/images/app_rating.png.png",
                        tabName: "Application Ratings"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
