import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:vendorapp/screens/postTask/whenwhere.dart';
import 'package:vendorapp/screens/post_detail.dart';
import 'package:vendorapp/widgets/link.dart';

import '../../provider/provider1.dart';
import '../../widgets/labelsField.dart';
import '../../widgets/title4.dart';
import '../../widgets/title5.dart';


class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
    int currentStep = 0;
  int index = 0;
  int index1 = 0;
  String? _selectedItem;
  @override
  TextEditingController title = TextEditingController();
  TextEditingController detail = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
final Provider11 = Provider.of<Provider1>(context); 
List<String> taskNames=['Air Cooler','Microwave','Ac Maintenance','Refrigerator','TV','Washing Machine','Water Purifier','Hair','MakeUp','Nails','Lasers','Bathroom','Kitchen','Full Home Cleaning','Sofa Carpet','Fumigation','Deep Cleaning','Electrician','Plumber','Carpenter','Furniture','Welder','False ceiling','Doctor','Nurse','Home Painting','Car Detailing','Car Mechanic','CCTV Services','Movers'] ;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff034047),
          title: Title4(heading: "Details", color: Colors.white, weight: FontWeight.bold),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Labels(heading: "Task Title", color: Color(0xff034047)),
                  Container(
                    child: TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Field is empty';
                        }
                        return null;
                      },
                      controller: title,
                      style: TextStyle(color: Color(0xff034047)),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff034047)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff034047)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Labels(heading: "Task Detail", color: Color(0xff034047)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index1 = 0;
                          });
                        },
                        child: Container(
                          height: 25.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: index1 == 0 ? Color(0xff034047) : Colors.grey,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                              child: Title5(
                            color: Colors.white,
                            heading: 'Message',
                            weight: FontWeight.bold,
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index1 = 1;
                          });
                        },
                        child: Container(
                          height: 25.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: index1 == 1 ? Color(0xff034047) : Colors.grey,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                              child: Title5(
                            color: Colors.white,
                            heading: 'Video',
                            weight: FontWeight.bold,
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index1 = 2;
                          });
                        },
                        child: Container(
                          height: 25.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: index1 == 2 ? Color(0xff034047) : Colors.grey,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                              child: Title5(
                            color: Colors.white,
                            heading: 'Audio',
                            weight: FontWeight.bold,
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  index1 == 0
                      ? TextFormField(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Field is empty';
                            }
                            return null;
                          },
                          controller: detail,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Color(0xff034047), width: 2)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xff034047), width: 2),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xff034047), width: 2),
                            ),
                          ),
                          minLines:
                              12, // any number you need (It works as the rows for the textarea)
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        )
                      : index1 == 1
                          ? Container(
                              width: double.infinity,
                              height: 70.h,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Color(0xff034047)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Link(linkText: "no file uploaded"),
                                        Container()
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Container(
                                      height: 30.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xff034047),
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Title4(
                                            color: Colors.white,
                                            heading: 'Record  video',
                                            weight: FontWeight.bold,
                                          ),
                                          Icon(
                                            Icons.video_chat_sharp,
                                            color: Colors.white,
                                            size: 20,
                                          )
                                        ],
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              height: 70.h,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Color(0xff034047)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Link(linkText: "no file uploaded"),
                                        Container()
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Container(
                                      height: 30.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xff034047),
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Title4(
                                            color: Colors.white,
                                            heading: 'Record  Audio',
                                            weight: FontWeight.bold,
                                          ),
                                          Icon(
                                            Icons.mic,
                                            color: Colors.white,
                                            size: 20,
                                          )
                                        ],
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                   SizedBox(
                    height: 20.h,
                  ),
                  Labels(heading: "Select Service", color: Color(0xff034047)),
                  SizedBox(
                    height: 10.h,
                  ),
                   Container(
                              width: 230.w,
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Padding(
                                padding:EdgeInsets.only(top: 1.h,bottom: 1.h,right: 10.w,left: 10.w),
                                child: Container(
                                  width: 200,
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value:_selectedItem, // set initial value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedItem=newValue;
                                      });
                                    },
                                    items: taskNames.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                    height: 10.h,
                  ),
                 Container(
                                  height: 48.h,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: ()async {
                                      if (_formKey.currentState!.validate()&&_selectedItem!=null) {
                                        Provider11.tasktitle=title.text;
                                        Provider11.taskdetail=detail.text;
                                        Provider11.taskName=_selectedItem;
                                       await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WhenWhere()),
                              );
                                      }
                                    },
                                    child: Text("Next"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Color(0xff034047)),
                                    ),
                                  )),
                ],
              ),
            ),
          ),
      ),
    );
  }
}

