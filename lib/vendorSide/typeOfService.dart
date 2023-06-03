import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/vendorSide/Location1.dart';


import '../provider/provider1.dart';
import '../widgets/selection1.dart';
import '../widgets/title3.dart';

class Service {
  final String imgAddress;
  final String name;

  Service({required this.imgAddress, required this.name});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imgAddress': imgAddress,
    };
  }
}

class ServicesGrid extends StatefulWidget {
  @override
  State<ServicesGrid> createState() => _ServicesGridState();
}

class _ServicesGridState extends State<ServicesGrid> {
  static List<Service> services = [
    Service(imgAddress: "assets/images/plumbing.png", name: "Plumbing Services"),
    Service(imgAddress: "assets/images/ac.png", name: "Ac Maintainance"),
    Service(imgAddress: "assets/images/electric.png", name: "Electric Sevices"),
    Service(imgAddress: "assets/images/mechanic.png", name: "HandyMan"),
    Service(imgAddress: "assets.images/insectides.png", name: "Fumigation"),
    Service(imgAddress: "cleaning.png", name: "House Cleaning"),
    Service(imgAddress: "assets/images/hairdresser.png", name: "Hair"),
    Service(imgAddress: "assets/images/cosmetics.png", name: "MakeUp"),
    Service(imgAddress: "assets/images/kitchen.png", name: "Kitchen"),
  ];

  final _items = services
      .map((e) => MultiSelectItem<Service>(e, e.name))
      .toList();
  List<Service> _selectedServices = [];

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    addData(){
      CollectionReference servicesWork = FirebaseFirestore.instance.collection('works').doc(Provider11.uid).collection("sub");

    for (Service service in _selectedServices) {
        servicesWork.add(service.toMap());
    }
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [   
                       Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/logo2.jpg'),
                              fit: BoxFit.fill,
                          ),
                            )
                      ),
                      SizedBox(width: 15.w,),
                      Title3(heading: "Please Select Your Services",color:Color(0xff034047) ,),              
                    ],
                  ),
            SizedBox(height: 20.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: MultiSelectDialogField(
                        items: _items,
                        title: Text("Services"),
                        selectedColor: Colors.blue,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        buttonIcon: Icon(
                          Icons.work,
                          color: Colors.blue,
                        ),
                        buttonText: Text(
                          "Tap to Add Your Services",
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16,
                          ),
                        ),
                        onConfirm: (results) {
                          _selectedServices = results;
                          print(_selectedServices[0]);
                        },
                      ),
            ),
            SizedBox(height: 20.h,),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 20.w),
               child: Container(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_selectedServices.isNotEmpty==true) {
                                addData();
                                    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Location1()),
                                 );
                              }
                            },
                            child: Text("Proceed"),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff034047)),
                            ),
                )
                         ),
             ),
          ],
        ),
              
      ),
    );
  }
}



