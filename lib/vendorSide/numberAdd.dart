import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/vendorSide/verifyNumber.dart';
import 'package:vendorapp/widgets/labelsField.dart';
import 'package:vendorapp/widgets/title3.dart';


class NumberAdd extends StatefulWidget {
  const NumberAdd({super.key});

  @override
  State<NumberAdd> createState() => _NumberAddState();
}

class _NumberAddState extends State<NumberAdd> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
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
                      Title3(heading: "Add Your Phone Number",color:Color(0xff034047) ,),              
                    ],
                  ),
                  SizedBox(height: 30.h,),
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Labels(heading: "Phone Number", color: Color(0xff034047)),
                        SizedBox(height: 5.h,),
                        Container(
                          child: TextFormField(
  controller: _controller,
  keyboardType: TextInputType.number,
  inputFormatters: <TextInputFormatter>[
   // for below version 2 use this
 FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
// for version 2 and greater youcan also use this
 FilteringTextInputFormatter.digitsOnly

  ],
  decoration: InputDecoration(
      enabledBorder: UnderlineInputBorder(      
                            borderSide: BorderSide(color: Color(0xff034047)),   
                            ),  
                            focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff034047)),
                                ),  
    hintText: "Phone Number",
    icon: Icon(Icons.phone_iphone,color: Color(0xff034047),)
  )
)
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Container(
                        height: 48.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VerifyNumber()),);
                          },
                          child: Text("Send"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff034047)),
                          ),
              )
            ),
              ],
            ),
          )
          ),
      ),
    );
  }
}

