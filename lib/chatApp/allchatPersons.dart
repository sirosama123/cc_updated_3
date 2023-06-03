// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_chat_bubble/chat_bubble.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
// import 'package:uuid/uuid.dart';
// import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
// import 'package:vendorapp/chatApp/landing.dart';
// import 'package:vendorapp/screens/mainhome.dart';
// import 'package:vendorapp/screens/signin.dart';
// import 'package:vendorapp/screens/terms.dart';
// import 'package:vendorapp/screens/testing.dart';
// import 'package:vendorapp/vendorSide/addService/type.dart';
// import 'package:vendorapp/vendorSide/numberAdd.dart';
// import 'package:vendorapp/vendorSide/serviceSelection.dart';
// import 'package:vendorapp/vendorSide/vendorHome.dart';
// import 'package:vendorapp/widgets/callout.dart';
// import 'package:vendorapp/widgets/description.dart';
// import 'package:vendorapp/widgets/heading.dart';
// import 'package:im_stepper/main.dart';
// import 'package:im_stepper/stepper.dart';
// import 'package:vendorapp/widgets/labelsField.dart';
// import 'package:vendorapp/widgets/title2.dart';
// import '../../provider/provider1.dart';
// import '../../widgets/squares.dart';
// import '../../widgets/title4.dart';
// import '../widgets/multi2.dart';
// import '../widgets/multi3.dart';
// import '../widgets/multiText.dart';
// import '../widgets/titleTune.dart';


// class UserAllChatPerson extends StatelessWidget {
//   const UserAllChatPerson({super.key});

//   @override
//    Widget build(BuildContext context) {
//     final Provider11 = Provider.of<Provider1>(context, listen: true);
//       var uuid = Uuid();
      
//     final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection("users").doc(Provider11.uid).collection("chatPersons").snapshots();
//     return Scaffold(
//       appBar: AppBar(
//         title: TitleTune(heading: "ALL CHATS", color: Colors.white, weight: FontWeight.bold, size: 21),
//         backgroundColor: Color(0xff034047),
//         leading: GestureDetector(
//           onTap: () async {
//             Navigator.pop(context);
//           },
//           child: Container(
//             height: 30.h,
//             width: 30.w,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(colors: [
//                 Color(0xff034047),
//                 Color.fromARGB(255, 4, 81, 89),
//               ]),
//               borderRadius: BorderRadius.circular(5.r),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromARGB(255, 4, 81, 89),
//                   offset: const Offset(0, 0),
//                   blurRadius: 10.0,
//                   spreadRadius: 2.0,
//                 ), //BoxShadow
//                 BoxShadow(
//                   color: Colors.white,
//                   offset: const Offset(0.0, 0.0),
//                   blurRadius: 0.0,
//                   spreadRadius: 0.0,
//                 ), //BoxShadow
//               ],
//             ),
//             child: Center(
//               child: Icon(
//                 Icons.arrow_back,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {






//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }

//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//           Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//             return GestureDetector(
//               onTap: ()async{
//                 if (data['status']=="unread") {
//                     FirebaseFirestore db = FirebaseFirestore.instance;
//                       await db.collection("users").doc(Provider11.uid).collection("chatPersons").doc(data['uid']).update({
                        
//                         "status":"read"
                                
//                       });
//                 }
//                  await   Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => ChatLanding(uid: data['uid'], name: data['name'],)),);
                  
                
//               },
//               child: ListTile(
//                 title: Multi3(color: Colors.black, subtitle: data['name'], weight: FontWeight.normal, size: 16),
//                 subtitle: Row(
//                   children: [
//                     data['name']!=Provider11.fullname?Multi(color: Colors.black, subtitle: "You: ", weight: FontWeight.normal, size: 17):Multi(color: Colors.black, subtitle: "${data['name']}: ", weight: FontWeight.normal, size: 17),
//                     data['message'].toString().length>25?Multi(color: Colors.black, subtitle: data['message'].toString().substring(0,24), weight: data['status']=="unread"?FontWeight.bold:FontWeight.normal, size: 17):Multi(color: Colors.black, subtitle: data['message'], weight:  data['status']=="unread"?FontWeight.bold:FontWeight.normal, size: 17),
//                   ],
//                 ),
//                 trailing: Text(data['time']),
//                 leading: CircleAvatar(radius: 25.r,backgroundColor: Colors.red,),
//               ),
//             );
//           }).toList(),
//         );
//       },
//     ),
//     );
//   }
// }





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:vendorapp/boarding_screen/presentation/contentModel.dart';
import 'package:vendorapp/chatApp/landing.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/screens/terms.dart';
import 'package:vendorapp/screens/testing.dart';
import 'package:vendorapp/vendorSide/addService/type.dart';
import 'package:vendorapp/vendorSide/numberAdd.dart';
import 'package:vendorapp/vendorSide/serviceSelection.dart';
import 'package:vendorapp/vendorSide/vendorHome.dart';
import 'package:vendorapp/widgets/callout.dart';
import 'package:vendorapp/widgets/description.dart';
import 'package:vendorapp/widgets/heading.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/title2.dart';
import '../../provider/provider1.dart';
import '../../widgets/squares.dart';
import '../../widgets/title4.dart';
import '../widgets/multi2.dart';
import '../widgets/multi3.dart';
import '../widgets/multiText.dart';


class UserAllChatPerson extends StatelessWidget {
  const UserAllChatPerson({super.key});

  @override
   Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
      var uuid = Uuid();
      
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection("users").doc(Provider11.uid).collection("chatPersons").snapshots();
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xff034047),
        title: Text("All Chats"),
      ),
      body: StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {






          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return GestureDetector(
              onTap: ()async{
                if (data['status']=="unread") {
                    FirebaseFirestore db = FirebaseFirestore.instance;
                      await db.collection("users").doc(Provider11.uid).collection("chatPersons").doc(data['uid']).update({
                        
                        "status":"read"
                                
                      });
                }
                 await   Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ChatLanding(uid: data['uid'], name: data['name'],)),);
                  
                
              },
              child: Column(
                children: [
                  ListTile(
                    title: Multi3(color: Colors.black, subtitle: data['name'], weight: FontWeight.normal, size: 16),
                    subtitle: Row(
                      children: [
                       
                        data['message'].toString().length>25?Multi(color: Colors.black, subtitle: data['message'].toString().substring(0,24), weight: data['status']=="unread"?FontWeight.bold:FontWeight.normal, size: 17):Multi(color: Colors.black, subtitle: data['message'], weight:  data['status']=="unread"?FontWeight.bold:FontWeight.normal, size: 17),
                      ],
                    ),
                    trailing: Text(data['time']),
                    leading: CircleAvatar(radius: 25.r,backgroundColor: Colors.red,),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: Divider(color:Color(0xff034047) ,thickness: 1.5,),
                  )
                ],
              ),
            );
          }).toList(),
        );
      },
    ),
    );
  }
}