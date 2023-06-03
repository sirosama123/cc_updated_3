import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/screens/postList.dart';
import 'package:vendorapp/screens/requestVendorProfile.dart';
import 'package:vendorapp/widgets/post_task_list.dart';
import 'package:vendorapp/widgets/smallDesc.dart';
import 'package:vendorapp/widgets/subhead.dart';
import 'package:vendorapp/widgets/title1.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../provider/provider1.dart';
import '../showingMap.dart';
import '../widgets/BTitle2.dart';
import '../widgets/labelsField.dart';


class PostDetail extends StatefulWidget {
  String? name;
  String? timee;
  String? address;
  String? datee;
  String? budget;
  String? detail;
  String? oid;
  String? service;
  String? task_id;
  String? time_of_post;
  String? date_of_post;
  PostDetail({
    super.key,
    required this.address,
    required this.budget,
    required this.datee,
    required this.detail,
    required this.name,
    required this.oid,
    required this.service,
    required this.timee,
    required this.task_id,
    required this.date_of_post,
    required this.time_of_post
    });

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    
 LatLng? loc;
    Future<LatLng> _getLatLngFromAddress(String address) async {
      List<Location> locations = await locationFromAddress(address);
      Location location = locations.first;
      loc = LatLng(location.latitude, location.longitude);
       Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowOnMap(loc: loc!, address: address, name: Provider11.fullname, city: Provider11.address,)));
      return LatLng(location.latitude, location.longitude);
  }

    return Scaffold(  
         appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ), 
          backgroundColor: Color(0xff034047),
          title: Text("Detail"),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              // SizedBox(height: 10.h,),
              // Center(
              //    child: ToggleSwitch(
              //     minWidth: 90.0,
              //     minHeight: 40.0,
              //     fontSize: 16.0,
              //     initialLabelIndex: 0,
              //     activeBgColor: [Colors.green],
              //     activeFgColor: Colors.white,
              //     inactiveBgColor: Colors.grey,
              //     inactiveFgColor: Colors.grey[900],
              //     totalSwitches: 4,
              //     labels: ['Open', 'Assigned', 'Completed','Reviewed'],
              //     onToggle: (index) {
              //       print('switched to: $index');
              //     },
              // ),
              //  ),
              SizedBox(height: 10.h,),
              Center(child: Title1(heading: "${widget.service}", color: Colors.black)),
              SizedBox(height: 20.h,),
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
                      Labels(heading: "Posted By", color: Color(0xff034047)),
                      SubHead(heading: "${widget.name}", color: Colors.black)
                    ],
                  )
                  ],),
                SDescription(description: "${widget.time_of_post}")
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
                      Labels(heading: "Location", color: Color(0xff034047)),
                      SubHead(heading: "${widget.address}", color: Colors.black)
                    ],
                  )
                  ],),
                  GestureDetector(
                    onTap: (){
                      _getLatLngFromAddress(widget.address.toString());
                    },
                    child: SubHead(heading: "View on Map", color: Colors.green)),
          
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
                      Labels(heading: "Due Date", color: Color(0xff034047)),
                      SubHead(heading: "${widget.datee}", color: Colors.black)
                    ],
                  )
                  ],),
                  Container()              
                ],
              ),
              SizedBox(height: 20.h,),
              Container(
                height: 150.h,
                width: double.infinity,
                color: Color(0xffD7DBDE),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Title3(heading: "TASK BUDGET ESTIMATE", color: Colors.black),
                    BTitle2(heading: "RS ${widget.budget}", color: Colors.green),
                    BTitle2(heading: "Awaiting Offer", color: Colors.black),
          
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              BTitle2(heading: "Task Detail", color: Color(0xff034047)),
              SizedBox(height: 10.h,),
              Title3(heading: "${widget.detail}", color: Colors.black),
              SizedBox(height: 20.h,),
              BTitle2(heading: "Add Attachments to your Task", color: Color(0xff034047)),
              SizedBox(height: 10.h,),
               Container(
                height: 30.h,
                width: 140.w,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(CupertinoIcons.camera),
                      Text("Attach files(s)")
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green),
                  ),
                )),
              SizedBox(height: 20.h,),
              BTitle2(heading: "Offers", color: Color(0xff034047)),
              SizedBox(height: 10.h,),
              RequestsProposals(task_id: widget.task_id, current_uid: Provider11.uid),
              SizedBox(height: 20.h,),
              BTitle2(heading: "Comments", color: Color(0xff034047)),
              SizedBox(height: 10.h,),
              SubHead(heading: '''Comment below for more details, Please do not share personal information, email, phone, SkypeID or website''', color: Color(0xff8C8D8F)),
              SizedBox(height: 10.h,),
              Container(
  // margin: EdgeInsets.all(15.0),
  height: 110.h,
  child: Row(
    children: [
      CircleAvatar(
        radius: 25,
        backgroundColor: Colors.pink,
        child: CircleAvatar(
          radius: 23,
          backgroundColor: Color.fromARGB(255, 13, 75, 125),
          child: Image.asset("assets/images/user.png",height: 25.h,width: 25.w,),
        ),
      ),     
      SizedBox(width: 5.w,),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 5,
                  color: Colors.grey)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    
                  ],
                ),
              ),
              // IconButton(
              //   icon: Icon(Icons.photo_camera ,  color: Colors.blueAccent),
              //   onPressed: () {},
              // ),
             
            ],
          ),
        ),
      ),

      
    ],
  ),
) ,
SizedBox(height: 10.h,),
SubHead(heading: "Be the first one to comment...", color: Color(0xff8C8D8F)),
 SizedBox(height: 20.h,),   
 Container(
                          height: 48.h,
                          width:150.w,
                           decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                
                              ),
                          child: ElevatedButton(
                            onPressed: () {
                               Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Post_List()),);
                            },
                            child: Text("Post List",style: TextStyle(color: Color(0xff034047),fontWeight: FontWeight.w500),),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                )
              ),

              ],
            ),
          ),
        ),
      
    );
  }
}
class RequestsProposals extends StatefulWidget {
  String? task_id;
  String current_uid;
   RequestsProposals({super.key,required this.task_id,required this.current_uid});

  @override
  State<RequestsProposals> createState() => _RequestsProposalsState();
}

class _RequestsProposalsState extends State<RequestsProposals> {
 

  Widget build(BuildContext context) {
     final Provider11 = Provider.of<Provider1>(context); 
   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').doc(widget.current_uid).collection("vendors_request").doc(widget.task_id).collection("data").snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return snapshot.hasData? GestureDetector(
              onTap:(){
              //  Navigator.push(context,MaterialPageRoute(builder: (context) =>RequestVendorProfile(uid: data['vendor_uid'],)));
              },
              child:ListTile(
                leading: CircleAvatar(radius: 25.r,backgroundColor: Colors.red,),
                title: Text(data['name']),
                subtitle: Text(data['status']),
                trailing:ElevatedButton(
                onPressed: ()async{
                  final FirebaseFirestore firestore = FirebaseFirestore.instance;
                   DocumentSnapshot snapshot = await firestore.collection('users').doc('${Provider11.uid}').collection("vendors_request").doc(widget.task_id).get();
  if (snapshot.exists) {
    var uuuid = snapshot.get('job_uid');
    print('Field Value: $uuuid');
         DocumentReference servicesWork = FirebaseFirestore.instance.collection("vendors").doc(data['vendor_uid']).collection("tasks").doc();
      await servicesWork.set({
        "name":Provider11.fullname,
        "jobTask":data['jobTask'],
        "date":data['date'],
        "time":data['time'],
        "address":data['address'],
        "status":"inprogress",
        "img":data['img'],
        "uid":Provider11.uid,
        "code":1,
        "task_id":widget.task_id,
        "amount":data['amount'],
        "oid":data['oid'],
        "all_tasks_uid":data['all_task_uid'],
        "payment_method":data['payment_method']
      });
      FirebaseFirestore.instance.collection('posted_jobs_data').doc(data['all_task_uid']).update({
        "status":"inprogress"
      });
     FirebaseFirestore.instance.collection('notifications').doc().set({
      "from":Provider11.uid,
      "to":data['vendor_uid'],
      "service":data['jobTask'],
      "status":"unread",
      "time":DateTime.now().toString(),
      "title":"${Provider11.fullname} accepted your proposal for ${data['jobTask']}",
      "from_name":Provider11.fullname,
      "to_name":data['name'],
      "profile":data['profile']
     });
     await FirebaseFirestore.instance.collection('users').doc(widget.current_uid).collection("vendors_request").doc(widget.task_id).delete();
     await FirebaseFirestore.instance.collection('jobs').doc(uuuid).delete();
     await FirebaseFirestore.instance.collection('vendors').doc(data['vendor_uid']).collection("sent_proposals").doc(widget.task_id).delete();
      Navigator.pop(context,true);
  } else {
    print('Document does not exist.${snapshot.data()}');
  }
                       

                }, child: Text("Accept")) ,
              ),
            ): Container(
                height: 150.h,
                width: double.infinity,
                color: Color(0xffD7DBDE),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/images/offer.png",height: 100.h,width: 100.h,),
                    Title3(heading: "Waiting for Offers", color: Color(0xff8C8D8F))
          
                  ],
                ),
              )
              ;
          }).toList(),
        );
      },
    );
  }
}