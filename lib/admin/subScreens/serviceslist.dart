import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:tap_to_expand/tap_to_expand.dart';
import '../../widgets/title4.dart';
import '../../widgets/titleTune.dart';
import '../widgets/serviceListView.dart';
import 'categorySelection.dart';
  
  
  class ServicesList extends StatelessWidget {
   ServicesList({super.key});

  @override
  Stream<DocumentSnapshot> _servicesStream = FirebaseFirestore.instance.collection('services').doc("Ao19VKeJIAD7kpgTCfkH").snapshots();

  Widget build(BuildContext context) {
    var a = [];
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
         appBar: AppBar(
        title: TitleTune(heading: "Service List", color: Colors.white, weight: FontWeight.bold, size: 21),
        backgroundColor: Color(0xff034047),
        leading: GestureDetector(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff034047),
                Color.fromARGB(255, 4, 81, 89),
              ]),
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 4, 81, 89),
                  offset: const Offset(0, 0),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xff034047),
        onPressed:()async{
          showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Add Service"),
                  content: const Text("Do you want to add new category?"),
                  actions: <Widget>[
                     IconsOutlineButton(
              onPressed: () {
                Navigator.of(ctx).pop();
  Navigator.push(
context,
MaterialPageRoute(builder: (ctx) => AddCategoryAdmin()),);
              },
              text: 'Yes',
              iconData: Icons.cancel_outlined,
              textStyle: TextStyle(color: Color(0xff034047)),
              iconColor: Color(0xff034047),
            ),
            IconsOutlineButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.push(
context,
MaterialPageRoute(builder: (context) => SelectCategory()),);
              },
              text: 'No',
              iconData: Icons.cancel_outlined,
              textStyle: TextStyle(color: Color(0xff034047)),
              iconColor: Color(0xff034047),
            ),
                  ],
                ),
              );
       

// CollectionReference ser = FirebaseFirestore.instance.collection('services');
// await ser
//     .doc("Ao19VKeJIAD7kpgTCfkH")
//     .update({'Appliances Repair.ty': {'new_field': 'new_value'}});


        },
    label: Title4(heading: "Add Service", color: Colors.white, weight: FontWeight.bold,),
  ),
        body:  StreamBuilder<DocumentSnapshot>(
      stream: _servicesStream,
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

       Map<String, dynamic>? userData = snapshot.data!.data()! as Map<String, dynamic>;
    // Access the user data using userData['FIELD_NAME']
    return 
      ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount:userData.keys.toList().length ,
                itemBuilder: (context,int){
                  return Padding(
                    padding:  EdgeInsets.only(top: 15.h,right: 10.w,left: 10.w),
                    child:TapToExpand(
                      color: Color(0xff034047),
          content:ListView.builder(
             shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                 itemCount:userData.values.toList()[int].keys.length ,
                itemBuilder: (context,i){
                  return  Container(
            child:TitleTune(heading: "${userData.values.toList()[int].values.toList()[i]['name']}", color: Colors.white, weight: FontWeight.bold, size: 10) ,
          );
                }
          ),
         
          title: Title4(heading: "${userData.keys.toList()[int]}", color: Colors.white, weight: FontWeight.bold),
          onTapPadding: 10,
          closedHeight: 70,
          scrollable: true,
          borderRadius: 10,
          openedHeight: 200,
        ),
                    //  Text("${userData.keys.toList()[int]}"),
                  );
                });
        
      
   } ))
    );
  }
}