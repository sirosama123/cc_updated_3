import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/chatApp/landing.dart';
import 'package:vendorapp/provider/provider1.dart';
import 'package:vendorapp/screens/request_service_screen.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/smaillTitlebold.dart';
import 'package:vendorapp/widgets/smallDesc.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'package:uuid/uuid.dart';
import '../widgets/description.dart';


class ProviderDescription extends StatelessWidget {
  String name;
  String service;
  String phone;
  String location;
  String age;
  String exp;
  String exp_desc;
  String uid;
  String profile;
  ProviderDescription({super.key,required this.name,required this.service,required this.uid,required this.age,required this.profile,required this.exp,required this.exp_desc,required this.location,required this.phone});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    var uuid = Uuid();
    var chatuid;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
        appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ), 
          backgroundColor: Color(0xff034047),
          title: Text("Detail"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            child: Column(
              children: [
                 Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color:Color(0xff034047) ,
                    blurRadius: 6.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 0.0),
                    // Shadow position
                  ),
                ],
      ),
      // height:110.h,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                  radius: 30.0,
                  backgroundImage:
                      NetworkImage("$profile"),
                  backgroundColor: Colors.blue,
                ),
                SizedBox(width: 10.w,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: 140.w),
                      child: Title3(heading: name, color: Colors.black),
                    ),
                   
                  ],
                )
                ],
              ),

              Padding(
                padding:  EdgeInsets.only(left: 0.w),
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
          
            ],
        ),
      ),
    ),
    SizedBox(height: 10.h,),
      Container(
              decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color:Color(0xff034047) ,
                    blurRadius: 6.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 0.0),
                    // Shadow position
                  ),
                ],
      ),
      height:200.h,
      child: Padding(
         padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Row(
                  children: [
                    Icon(CupertinoIcons.briefcase,color:Color(0xff034047) ,),
                    SizedBox(width: 4.w,),
                    Labels(heading: "Job", color: Color(0xff034047)),
                  ],
                ),
                
                Labels(heading: service, color: Color(0xff034047)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.phone,color:Color(0xff034047) ,),
                    SizedBox(width: 4.w,),
                    Labels(heading: "Call ", color: Color(0xff034047)),
                  ],
                ),
                Labels(heading: phone, color: Color(0xff034047)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.location,color:Color(0xff034047) ,),
                    SizedBox(width: 4.w,),
                    Labels(heading: "Location ", color: Color(0xff034047)),
                  ],
                ),
                Labels(heading: location, color: Color(0xff034047)),
              ],
            ),
            Container(
                        height: 48.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async{
                          
                            // FirebaseFirestore db = FirebaseFirestore.instance;
                            // await db.collection("users").doc(Provider11.uid).update({
                            //    "chatPersons":{
                            //      uid:{
                            //       "name":name,
                            //       "uid":uid,
                            //       "service":service,
                            //       "chatUid":Provider11.uid+uid
                            //     }
                            //    }
                            //  });
                            //  await db.collection("vendors").doc(uid).update({
                            //    "chatPersons":{
                            //      Provider11.uid:{
                            //       "name":Provider11.fullname,
                            //       "uid":Provider11.uid,
                            //       "service":service,
                            //       "chatUid":Provider11.uid+uid
                            //     }
                            //    }
                            //  });
                           Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ChatLanding(uid: uid, name: name,)),);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Icon(CupertinoIcons.envelope,color:Colors.white ,),
                            SizedBox(width: 5.w,),
                            Text("Message")
                          ],),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff034047)),
                          ),
              )
            )
          ],
        ),
      ),
            ),
 
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Title3(heading: "About", color: Color(0xff034047)),
              SizedBox(width: 5.w,),
              Icon(CupertinoIcons.person_fill,color: Color(0xff034047),)
            ],),
            SizedBox(height: 10.h,),
            Container(
               decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color:Color(0xff034047) ,
                    blurRadius: 6.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 0.0),
                    // Shadow position
                  ),
                ],
      ),
      height:80.h,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                    children: [
                      Icon(CupertinoIcons.person,color:Color(0xff034047) ,),
                      SizedBox(width: 4.w,),
                      Labels(heading: "Age", color: Color(0xff034047)),
                    ],
                  ),
                  
                  Labels(heading: age, color: Color(0xff034047)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                    children: [
                      Icon(Icons.history,color:Color(0xff034047) ,),
                      SizedBox(width: 4.w,),
                      Labels(heading: "Experience", color: Color(0xff034047)),
                    ],
                  ),
                  
                  Labels(heading: exp, color: Color(0xff034047)),
                ],
              ),
          ],
        ),
      ) ,
            ),
             SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Title3(heading: "Reviews", color: Color(0xff034047)),
              SizedBox(width: 5.w,),
              Icon(Icons.reviews,color: Color(0xff034047),)
            ],),
            SizedBox(height: 10.h,),
              Container(
               decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color:Color(0xff034047) ,
                    blurRadius: 6.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 0.0),
                    // Shadow position
                  ),
                ],
      ),
      height:150.h,
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        child:Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stitle(linkText: "Abdul Sami"),
                    Stitle(linkText: "2 days ago"),
                  ],
                ),
                
                SizedBox(height: 3.h,),
                Description(description: "works very neatly")
              ],
            )
          ],
        ),
        SizedBox(height: 8.h,),
         Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stitle(linkText: "sharjeel ur rehman"),
                    Stitle(linkText: "5 days ago"),
                  ],
                ),
                SizedBox(height: 3.h,),
                Description(description: "works very neatly")
              ],
            )
          ],
        ),
        SizedBox(height: 8.h,),
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stitle(linkText: "Abdul haseeb"),
                    Stitle(linkText: "8 days ago"),
                  ],
                ),
                
                SizedBox(height: 3.h,),
                Description(description: "works very neatly")
              ],
            )
          ],
        ),
          ],
        )
      ),
      ),
      SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Title3(heading: "Portfolio", color: Color(0xff034047)),
              SizedBox(width: 5.w,),
              Icon(Icons.dashboard,color: Color(0xff034047),)
            ],),
            SizedBox(height: 10.h,),
        Container(
               decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color:Color(0xff034047) ,
                    blurRadius: 6.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 0.0),
                    // Shadow position
                  ),
                ],
      ),
      height:150.h,
      width: double.infinity,
      child: Padding(
         padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(CupertinoIcons.briefcase,color:Color(0xff034047) ,),
                      SizedBox(width: 4.w,),
                      Labels(heading: "Skils", color: Color(0xff034047)),
                    ],
                  ),
              Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      Labels(heading: "$exp_desc", color: Color(0xff034047)),
                    ],
                  ),
              Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      Labels(heading: "Ability to work in a team or \nindependently", color: Color(0xff034047)),
                    ],
                  ),  
              Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      Labels(heading: "Problem Solving", color: Color(0xff034047)),
                    ],
                  ),  
          ],
        ),
      ),
      ),
      SizedBox(height: 20.h,),
      Container(
                        height: 48.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RequestService(service: service, uid: uid,)),);
                          },
                          child: Text("Request Service"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff034047)),
                          ),
              )
            )
              ],
            ),
          ),
        ),
      ),
    );
  }
}