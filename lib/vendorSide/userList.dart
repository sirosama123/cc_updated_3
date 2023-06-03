import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendorapp/widgets/dashboardSquare.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:vendorapp/widgets/jobs.dart';
import 'package:vendorapp/widgets/sqDB2.dart';
import 'package:vendorapp/widgets/squares.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title5.dart';
import 'package:vendorapp/widgets/wideSquaresDb.dart';

import '../widgets/labelsField.dart';
import '../widgets/smallDesc.dart';
import '../widgets/subhead.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: Container(
              
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 205, 203, 203),
                    borderRadius: BorderRadius.circular(15.r)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Heading2(heading: "User 1", color: Colors.black),
                              Container()
                            ],
                          ),
                         Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Image.asset("assets/images/user.png",height: 35.h,width: 35.w,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "User Name", color: Color(0xff034047)),
                                      SubHead(heading: "Name of Person", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Icon(CupertinoIcons.location,color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "Residency", color: Color(0xff034047)),
                                      SubHead(heading: "Karachi", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                  SubHead(heading: "View on Map", color: Colors.green),
                          
                                ],
                              ),
                              SizedBox(height: 10.h,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Icon(CupertinoIcons.calendar,color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "Joining Date", color: Color(0xff034047)),
                                      SubHead(heading: "10-09-2023", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                  Container()              
                                ],
                              ),
                              SizedBox(height: 10.h,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Icon(CupertinoIcons.envelope,color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "Email", color: Color(0xff034047)),
                                      SubHead(heading: "abc@gmail.com", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                  Container()              
                                ],
                              ),
                              SizedBox(height: 10.h,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Icon(CupertinoIcons.phone,color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "Phone", color: Color(0xff034047)),
                                      SubHead(heading: "03242824117", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                  Container()              
                                ],
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
      
      
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: Container(
              
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 205, 203, 203),
                    borderRadius: BorderRadius.circular(15.r)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Heading2(heading: "User 2", color: Colors.black),
                              Container()
                            ],
                          ),
                         Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Image.asset("assets/images/user.png",height: 35.h,width: 35.w,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "User Name", color: Color(0xff034047)),
                                      SubHead(heading: "Name of Person", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Icon(CupertinoIcons.location,color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "Residency", color: Color(0xff034047)),
                                      SubHead(heading: "Karachi", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                  SubHead(heading: "View on Map", color: Colors.green),
                          
                                ],
                              ),
                              SizedBox(height: 10.h,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Icon(CupertinoIcons.calendar,color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "Joining Date", color: Color(0xff034047)),
                                      SubHead(heading: "10-09-2023", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                  Container()              
                                ],
                              ),
                              SizedBox(height: 10.h,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Icon(CupertinoIcons.envelope,color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "Email", color: Color(0xff034047)),
                                      SubHead(heading: "abc@gmail.com", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                  Container()              
                                ],
                              ),
                              SizedBox(height: 10.h,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Icon(CupertinoIcons.phone,color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "Phone", color: Color(0xff034047)),
                                      SubHead(heading: "03242824117", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                  Container()              
                                ],
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: Container(
              
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 205, 203, 203),
                    borderRadius: BorderRadius.circular(15.r)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Heading2(heading: "User 3", color: Colors.black),
                              Container()
                            ],
                          ),
                         Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Image.asset("assets/images/user.png",height: 35.h,width: 35.w,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "User Name", color: Color(0xff034047)),
                                      SubHead(heading: "Name of Person", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Icon(CupertinoIcons.location,color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "Residency", color: Color(0xff034047)),
                                      SubHead(heading: "Karachi", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                  SubHead(heading: "View on Map", color: Colors.green),
                          
                                ],
                              ),
                              SizedBox(height: 10.h,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Icon(CupertinoIcons.calendar,color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "Joining Date", color: Color(0xff034047)),
                                      SubHead(heading: "10-09-2023", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                  Container()              
                                ],
                              ),
                              SizedBox(height: 10.h,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Icon(CupertinoIcons.envelope,color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "Email", color: Color(0xff034047)),
                                      SubHead(heading: "abc@gmail.com", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                  Container()              
                                ],
                              ),
                              SizedBox(height: 10.h,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 27,
                                      backgroundColor: Color.fromARGB(255, 13, 75, 125),
                                      child: Icon(CupertinoIcons.phone,color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Labels(heading: "Phone", color: Color(0xff034047)),
                                      SubHead(heading: "03242824117", color: Colors.black)
                                    ],
                                  )
                                  ],),
                                  Container()              
                                ],
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}