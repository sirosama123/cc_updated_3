import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/subhead.dart';


class MyApp2 extends StatefulWidget {
  String oid;
  int status;
  MyApp2({Key? key,required this.oid,required this.status}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  List<StepperData> stepperData = [
    StepperData(
        title: StepperText(
          "Order Placed",
          textStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        subtitle: StepperText("Your order has been placed"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Color(0xff034047),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_one, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Preparing"),
        subtitle: StepperText("Your order is being prepared"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Color(0xff034047),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_two, color: Colors.white),
        )),
    StepperData(
        title: StepperText("On the way"),
        subtitle: StepperText(
            "Our delivery executive is on the way to deliver your item"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
                            color: Color(0xff034047),

              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_3, color: Colors.white),
        )),
    StepperData(
      title: StepperText("Service Completed",
          textStyle: const TextStyle(
            color: Colors.grey,
          )),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ), 
          backgroundColor: Color(0xff034047),
          title: Text("Trace Order"),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 7.h,left: 20.w),
                child: Row(
                  children: [
                    SubHead(heading: "OrderNo :", color: Colors.black),
                    Labels(heading: "${widget.oid}", color: Colors.black)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only( left: 20.w),
                child: AnotherStepper(
                  stepperList: stepperData,
                  stepperDirection: Axis.vertical,
                  activeBarColor: Color(0xff034047),
                  iconWidth: 40,
                  iconHeight: 40,
                  inActiveBarColor: Colors.grey,
                  activeIndex: 2,
                  barThickness: 8,
                ),
              ),
              Container(
                            height: 48.h,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                            
                              },
                              child: Text("Cancel"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                  )
                ),
                SizedBox(height: 20.h,),
                Container(
                  height: 48.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ), 
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      
                      children: [
                        Image.asset("assets/images/warn.png",height: 35.h,width: 35.h,),
                        SizedBox(width: 7.w,),
                        Labels(heading: "Once your order is confirmed you \ncan't cancel it!", color: Colors.red)
                      ],
                    ),
                  ),   
                )
            ],
          ),
        ),
      ),
    );
  }
}