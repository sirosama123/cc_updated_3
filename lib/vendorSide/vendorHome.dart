import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/screens/mainhome.dart';

import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/vendorSide/profile.dart';
import 'package:vendorapp/vendorSide/servicesList.dart';
import 'package:vendorapp/widgets/BTitle2.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/heading2.dart';

import 'package:flutter/material.dart';
import 'package:vendorapp/widgets/mainHomeVendor.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'package:vendorapp/widgets/title4.dart';
import 'package:vendorapp/widgets/title5.dart';

import '../chatApp/vendorChat.dart';
import '../mainCredit/wallet.dart';
import '../provider/provider1.dart';
import '../screens/notifications.dart';
import '../screens/serviceslist.dart';
import '../survey/survey.dart';
import '../widgets/profile.dart';
import 'bookings/bookingMainScreen.dart';
import 'myjobs/myjobs.dart';

class vendorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage()
      // BookingMainScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff034047)),
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: Colors.pink,
                child: CircleAvatar(
                      radius: 22.r,
                      backgroundImage:
                          NetworkImage("${Provider11.profile}"),
                      backgroundColor: Colors.blue,
                    ),
              ),
              SizedBox(width: 5.w,),
              Column(
                children: [
                  Title4(heading: "${Provider11.fullname}", color: Color(0xff034047), weight: FontWeight.w600,),
                  Title5(heading: "${Provider11.address}", color: Color(0xff034047), weight: FontWeight.w600)
                ],
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff034047),
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              height: 70.h,
              child: DrawerHeader(
                
                child: Row(
              
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Colors.pink,
                  child: CircleAvatar(
                        radius: 22.r,
                       backgroundImage:
                          NetworkImage("${Provider11.profile}"),
                        backgroundColor: Colors.blue,
                      ),
                ),
                SizedBox(width: 5.w,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Title4(heading: "${Provider11.fullname}", color: Color(0xff034047), weight: FontWeight.w600,),
                    Title5(heading: "${Provider11.address}", color: Color(0xff034047), weight: FontWeight.w600)
                  ],
                )
              ],
          ),
                ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Divider(
              color: Colors.white,
              height: 2.h,
            ),
            Container(
              color: Color(0xff034047),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Container(
                  color: Color(0xff034047),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.briefcase,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        GestureDetector(
                          onTap:(){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BookingMainScreen(),),);
                          },
                          child: Heading2(
                            color: Colors.white,
                            heading: 'Jobs',
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Divider(
                      color: Colors.white,
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.square_list,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                         GestureDetector(
                          onTap:(){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyJobs(),),);
                          },
                          child: Heading2(
                            color: Colors.white,
                            heading: 'My Jobs Status',
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Divider(
                      color: Colors.white,
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Heading2(
                          color: Colors.white,
                          heading: 'Address',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Divider(
                      color: Colors.white,
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SurveyScreenForm(),),);
                      },
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.folder,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Heading2(
                            color: Colors.white,
                            heading: 'Survey Form',
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Divider(
                      color: Colors.white,
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    GestureDetector(
                      onTap: (){
                         Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Wallet(),),);
                      },
                      child: Row(
                        children: [
                          Icon(
                             Icons.account_balance_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Heading2(
                            color: Colors.white,
                            heading: 'Wallet',
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Divider(
                      color: Colors.white,
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.money_dollar_circle,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Heading2(
                          color: Colors.white,
                          heading: 'Total Earning',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Divider(
                      color: Colors.white,
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Heading2(
                          color: Colors.white,
                          heading: 'Sign out',
                        )
                      ],
                    ),
                  
                    
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            
          ],
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            VendorMain(),
            Notifications(),
            ServicesList1(),
            VendorAllChat(),
            Profile1()
          ],
        ),
      ),
     
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
            activeColor: Color(0xff034047),
            textAlign: TextAlign.center,
          ),
           BottomNavyBarItem(
            icon: Icon(Icons.notifications_outlined),
            title: Text(
              'Notifications',
            ),
            activeColor: Color(0xff034047),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.briefcase),
            title: Text('Services'),
            activeColor: Color(0xff034047),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            title: Text(
              'Messages',
            ),
            activeColor: Color(0xff034047),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.person),
            title: Text('Profile'),
            activeColor: Color(0xff034047),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    );
  }
}
