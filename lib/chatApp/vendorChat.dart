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
// import 'package:vendorapp/chatApp/vendorChatScreen.dart';
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


// class VendorAllChat extends StatelessWidget {
//   const VendorAllChat({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Provider11 = Provider.of<Provider1>(context, listen: true);
//       var uuid = Uuid();
      
//     final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection("vendors").doc(Provider11.uid).collection("chatPersons").snapshots();
//     return Scaffold(
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
//                       await db.collection("vendors").doc(Provider11.uid).collection("chatPersons").doc(data['uid']).update({

//                         "status":"read"
                                
//                       });
//                 }
//                  await   Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => VendorChatLanding(chatUid: data['chatUid'], uid: data['uid'],)),);
                  
                
//               },
//               child: ListTile(
//                 title: Multi3(color: Colors.black, subtitle: data['name'], weight: FontWeight.normal, size: 16),
//                 subtitle: data['message'].toString().length>25?Multi(color: Colors.black, subtitle: data['message'].toString().substring(0,24), weight: data['status']=="unread"?FontWeight.bold:FontWeight.normal, size: 17):Multi(color: Colors.black, subtitle: data['message'], weight:  data['status']=="unread"?FontWeight.bold:FontWeight.normal, size: 17),
//                 trailing: Text(data['name']),
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
import 'package:vendorapp/chatApp/vendorChatScreen.dart';
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


class VendorAllChat extends StatelessWidget {
  const VendorAllChat({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
      var uuid = Uuid();
      
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection("vendors").doc(Provider11.uid).collection("chatPersons").snapshots();
    return Scaffold(
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
                      await db.collection("vendors").doc(Provider11.uid).collection("chatPersons").doc(data['uid']).update({

                        "status":"read"
                                
                      });
                }
                 await   Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => VendorChatLanding(chatUid: data['chatUid'], uid: data['uid'],)),);
                  
                
              },
              child: ListTile(
                title: Multi3(color: Colors.black, subtitle: data['name'], weight: FontWeight.normal, size: 16),
                subtitle: data['message'].toString().length>25?Multi(color: Colors.black, subtitle: data['message'].toString().substring(0,24), weight: data['status']=="unread"?FontWeight.bold:FontWeight.normal, size: 17):Multi(color: Colors.black, subtitle: data['message'], weight:  data['status']=="unread"?FontWeight.bold:FontWeight.normal, size: 17),
                trailing: Text(data['name']),
                leading: CircleAvatar(radius: 25.r,backgroundColor: Colors.red,),
              ),
            );
          }).toList(),
        );
      },
    ),
    );
  }
}