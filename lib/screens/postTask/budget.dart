import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:vendorapp/screens/post_detail.dart';
import 'package:vendorapp/widgets/link.dart';

import '../../provider/provider1.dart';
import '../../widgets/labelsField.dart';
import '../../widgets/title4.dart';
import '../../widgets/title5.dart';
import '../confirmation_booking.dart';


class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  @override
   TextEditingController budget = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String index1="credit";
  Widget build(BuildContext context) {
     final Provider11 = Provider.of<Provider1>(context); 
    
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Color(0xff034047),
          title: Title4(heading: "Budget", color: Colors.white, weight: FontWeight.bold),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Labels(
                  heading: "What's Your budget estimate?",
                  color: Color(0xff034047)),
              Container(
                child: TextFormField(
                   keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                  validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Field is empty';
                                  }
                                  return null;
                                },
                  controller: budget,
                  style: TextStyle(color: Color(0xff034047)),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff034047)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff034047)),
                      ),
                      hintText: "eg 4999"),
                ),
              ),
              SizedBox(height: 20.h,),
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index1 = "credit";
                          });
                        },
                        child: Container(
                          height: 25.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: index1 ==  "credit" ? Color(0xff034047) : Colors.grey,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                              child: Title5(
                            color: Colors.white,
                            heading: 'CREDIT',
                            weight: FontWeight.bold,
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index1 = "cod";
                          });
                        },
                        child: Container(
                          height: 25.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: index1 == "cod" ? Color(0xff034047) : Colors.grey,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                              child: Title5(
                            color: Colors.white,
                            heading: 'COD',
                            weight: FontWeight.bold,
                          )),
                        ),
                      ),
                    
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
               SizedBox(height: 5.h,),
                Container(
                                height: 48.h,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {

                                    if (_formKey.currentState!.validate()) {
                                      Provider11.taskbudget=budget.text;
                                      Provider11.pm=index1;
                                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ConfirmationBooking(service: '',)),
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
          ),),
      ) ,
    );
  }
}