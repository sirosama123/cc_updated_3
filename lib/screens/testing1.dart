// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/heading2.dart';

import 'orders/postsScreen.dart';



class MyApp3 extends StatelessWidget {
  const MyApp3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Kindacode.com',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: const Text('Kindacode.com'),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search for something',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.camera_alt)),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 400,
                child: Center(
                  child: Text(
                    'This is an awesome shopping platform',
                  ),
                ),
              ),
              Container(
                height: 1000,
                color: Colors.pink,
              ),
            ]),
          ),
        ],
      ),
       drawer: Drawer(  
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset("assets/images/logo2.jpg")
                ),
              SizedBox(height: 7.h,),
              Divider(
                color: Colors.white,
                height: 2.h,
              ),
              Container(
                color: Color(0xff034047),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 7.w),
                  child: Container(
                    color: Color(0xff034047),
                    child: Column(children: [
                    SizedBox(height: 15.h,),  
                      Row(
                    children: [
                      Icon(Icons.person,color: Colors.white,),
                      SizedBox(width: 10.w,),
                      Heading2(color: Colors.white, heading: 'Profile',)
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Icon(Icons.chat,color: Colors.white,),
                      SizedBox(width: 10.w,),
                      Heading2(color: Colors.white, heading: 'Chat',)
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: (){
                     
                      
                    },
                    child: Row(
                      children: [
                        Icon(Icons.luggage,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Heading2(color: Colors.white, heading: 'Order',)
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Icon(Icons.share,color: Colors.white,),
                      SizedBox(width: 10.w,),
                      Heading2(color: Colors.white, heading: 'ShareApp',)
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.white,),
                      SizedBox(width: 10.w,),
                      Heading2(color: Colors.white, heading: 'Rate us',)
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone,color: Colors.white,),
                      SizedBox(width: 10.w,),
                      Heading2(color: Colors.white, heading: 'Contact us',)
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Icon(Icons.privacy_tip,color: Colors.white,),
                      SizedBox(width: 10.w,),
                      Heading2(color: Colors.white, heading: 'Privacy',)
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                    ]),
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup()),);
                            },
                            child: Row(children: [
                              Text("Log out"),
                              SizedBox(width: 5.w,),
                              Icon(Icons.logout_outlined)
                            ],),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff034047)),
                            ),
                          )),
              ),
             
            ],
            
          ),
         ) ,
    );
  }
}