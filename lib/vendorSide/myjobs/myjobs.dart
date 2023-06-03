import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider1.dart';
import '../../widgets/multiText.dart';
import '../../widgets/myjobRect.dart';
import '../bookings/bookingMainScreen.dart';
import 'completed.dart';
import 'jobDetails2.dart';
import 'ongoing.dart';


class MyJobs extends StatefulWidget {
  const MyJobs({super.key});

  @override
  State<MyJobs> createState() => _MyJobsState();
}

class _MyJobsState extends State<MyJobs> {
  @override
   String? _selectedItem;
  Widget build(BuildContext context) {
    List<String> status=['ongoing','pending','completed'] ;
    return Scaffold(
         appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ), 
          backgroundColor: Color(0xff034047),
          title: Text("My Jobs"),
        ),
        body: Padding(
          padding:EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
                        
        
                              SizedBox(height: 30.h,),
                              GestureDetector(
                                onTap: (){
                                   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ongoing()),
                          );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red,width: 1),
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.red.withOpacity(0.5)
                                  ),
                                  child: Center(
                                    child: Multi(color: Colors.white, subtitle: "Ongoing Jobs", weight: FontWeight.bold, size: 12),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              GestureDetector(
                                onTap: (){
                                  
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange,width: 1),
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.orange.withOpacity(0.5)
                                  ),
                                  child: Center(
                                    child: Multi(color: Colors.white, subtitle: "Pending Jobs", weight: FontWeight.bold, size: 12),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              GestureDetector(
                                onTap: (){
  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Completed1()),
                          );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green,width: 1),
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.green.withOpacity(0.5)
                                  ),
                                  child: Center(
                                    child: Multi(color: Colors.white, subtitle: "Completed Jobs", weight: FontWeight.bold, size: 12),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              
            ],
          ),
        ) ,
    );
  }
}

