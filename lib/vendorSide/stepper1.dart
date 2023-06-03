import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';



class Stepper1 extends StatefulWidget {
  int? activeStatus;
  Stepper1({
    Key? key,
    required this.activeStatus
    }) : super(key: key);

  @override
  State<Stepper1> createState() => _Stepper1State();
}

class _Stepper1State extends State<Stepper1> {
  List<StepperData> stepperData = [
    StepperData(
        title: StepperText(
          "Job Pending",
        
        ),
        subtitle: StepperText("Mon 9 Sep 16:47"),
        iconWidget: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.circle, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Job in Progress"),
        subtitle: StepperText("Job is in Progress"),
        iconWidget: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_two, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Job Completed"),
        subtitle: StepperText(
            "Complteted"),
        iconWidget: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_3, color: Colors.white),
        )),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            AnotherStepper(
              stepperList: stepperData,
              stepperDirection: Axis.vertical,
              iconWidth: 40,
              iconHeight: 40,
              activeBarColor: Colors.green,
              inActiveBarColor: Colors.grey,
              inverted: false,
              activeIndex: widget.activeStatus!,
              barThickness: 8,
            ),
          ],
       
    );
  }
}