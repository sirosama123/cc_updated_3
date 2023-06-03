import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/Initial.dart';
import 'package:vendorapp/provider/provider1.dart';
import 'package:vendorapp/screens/login.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin_fixer.dart';
import 'package:vendorapp/splashScreen1.dart';
import 'package:vendorapp/vendorSide/Location1.dart';
import 'package:vendorapp/vendorSide/addService/category.dart';
import 'package:vendorapp/vendorSide/createAccount.dart';
import 'package:vendorapp/vendorSide/customerServiceProfile.dart';
import 'package:vendorapp/vendorSide/fixer_completed.dart';
import 'package:vendorapp/vendorSide/loginVendor.dart';
import 'package:vendorapp/vendorSide/myjobs/myjobs.dart';
import 'package:vendorapp/vendorSide/servicetype.dart';
import 'package:vendorapp/vendorSide/typeOfService.dart';
import 'package:vendorapp/vendorSide/vendorHome.dart';

import 'admin/adminHome.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
        designSize:  Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ChangeNotifierProvider(
            create: (context) => Provider1(),
            child: MaterialApp(
                 initialRoute: '/',
      routes: {
        '/': (context) => 
        // SearchBarScreen(),
        SplashScreen1(),
        '/vendorHome': (context) => vendorHome(),
        '/addCategory':(context) => AddCategory(),
      },
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                ),
          );
        });
}

}