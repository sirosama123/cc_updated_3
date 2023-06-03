import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider1.dart';
import '../../widgets/multiText.dart';
import '../../widgets/myjobRect.dart';
import 'completed.dart';
import 'ongoingUser.dart';

class OrdersStatus extends StatefulWidget {
  const OrdersStatus({super.key});

  @override
  State<OrdersStatus> createState() => _OrdersStatusState();
}

class _OrdersStatusState extends State<OrdersStatus> {
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
          title: Text("My Orders Status"),
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
                                builder: (context) => OngoingUsers()),
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
  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CompletedUser()),
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

