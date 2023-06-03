import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vendorapp/admin/subScreens/userDetail.dart';
import 'package:vendorapp/admin/subScreens/vendorDetail.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/admin/widgets/smallDBsquares.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/BTitle2.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/heading2.dart';

import 'package:flutter/material.dart';
import 'package:vendorapp/widgets/mainHomeVendor.dart';
import 'package:vendorapp/widgets/title3.dart';
import 'package:vendorapp/widgets/title4.dart';
import 'package:vendorapp/widgets/title5.dart';

import '../../widgets/titleTune.dart';
import '../Initial.dart';
import '../widgets/shadowText.dart';



class DashBoardAdmin extends StatelessWidget {
   double? a;
   double? b;
   double? c;
   double? d;
   DashBoardAdmin({super.key,required this.a,required this.b,required this.c,required this.d});

  @override
  Widget build(BuildContext context) {










  List<ChartData> chartData=[
    ChartData(name: "Users", val: a),
    ChartData(name: "Services", val: b),
    ChartData(name: "Vendors", val: c),
    ChartData(name: "Jobs", val: a),
  ];
  List<int> abc =[];



    return Scaffold(
        appBar: AppBar(
        title: TitleTune(heading: "Application Ratings", color: Colors.white, weight: FontWeight.bold, size: 21),
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

      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding:  EdgeInsets.all(10),
                  child: DocumentCountWidget(collectionName: "users", heading: 'Total Users',)
                )),
                   Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                      width: 150.w,
                      height: 130.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color:Color.fromARGB(255, 6, 118, 131)),
                                      ),
                                      Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: CustomPaint(
                        size: Size(100.w, 170.h),
                        painter: CustomCardShapePainter(
                          10,
                         Color(0xff034047),
                          Color(0xff034047)
                        ),
                      ),
                                      ),
                                      Positioned.fill(
                        child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          Container(
                              height: 130.h,
                              width: 130.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: Container()
                              )),
                            Positioned(
                              bottom: 3.h,
                              right: 3.w,
                              left: 3.w,
                              child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                       smallDBsquare(
                    bgColor: Colors.transparent, 
                    counts: 12, 
                    height: 90.h, 
                    mainhead: 'Total Services', 
                    width: 120.w,
                    ),
                                     
                                    ],
                                  ),
                              )
                        ],
                      ),
                                      )),
                                    ],
                                  ),
                )),
                 
            ],
          ),
          // SizedBox(height: 10.h,),
           Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding:  EdgeInsets.all(10),
                  child: DocumentCountWidget(collectionName: "vendors", heading: 'Total Vendors',)
                )),
                   Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child:DocumentCountWidget(collectionName: "posted_jobs_data", heading: 'Posted Jobs',)
                )),
                 
            ],
          ),
          g2(chartData: chartData,)
          // BarGraph(
          //   data: [a!, b!, c!, d!], // Replace with your data values
          //   names: ['A', 'B', 'C', 'D'], // Replace with your x-axis names
          // ),
        ],
      ),
    );
  }
}




class DocumentCountWidget extends StatelessWidget {
  final String collectionName;
  final String heading;
  DocumentCountWidget({required this.collectionName,required this.heading});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(collectionName).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        }

        int documentCount = snapshot.data!.size;
        
        return Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                      width: 150.w,
                      height: 130.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color:Color.fromARGB(255, 6, 118, 131)),
                                      ),
                                      Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: CustomPaint(
                        size: Size(100.w, 170.h),
                        painter: CustomCardShapePainter(
                          10,
                         Color(0xff034047),
                          Color(0xff034047)
                        ),
                      ),
                                      ),
                                      Positioned.fill(
                        child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          Container(
                              height: 130.h,
                              width: 130.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: Container()
                              )),
                            Positioned(
                              bottom: 3.h,
                              right: 3.w,
                              left: 3.w,
                              child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                       smallDBsquare(
                    bgColor: Colors.transparent, 
                    counts: double.parse(documentCount.toString()), 
                    height: 90.h, 
                    mainhead: '$heading', 
                    width: 120.w,
                    ),
                                     
                                    ],
                                  ),
                              )
                        ],
                      ),
                                      )),
                                    ],
                                  );
      },
    );
  }
}











class BarGraph extends StatefulWidget {
  final List<double> data;
  final List<String> names;

  BarGraph({required this.data, required this.names});

  @override
  _BarGraphState createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: BarChart(
          BarChartData(
            barGroups: List.generate(widget.data.length, (index) {
              return BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                    toY: widget.data[index],
                   
                  ),
                ],
              );
            }),
            titlesData: FlTitlesData(
              show: true,
              
            ),
          ),
          swapAnimationDuration: Duration(milliseconds: 500),
        ),
      ),
    );
  }
}




class g2 extends StatelessWidget {
  List<ChartData> chartData;
   g2({super.key,required this.chartData});

  @override
 @override
    Widget build(BuildContext context) {
        
        return  Container(
                    child: SfCartesianChart(
                                        
                        primaryXAxis: CategoryAxis(
                        
                        ),
                        // tooltipBehavior: _tooltipBehavior,
                       
                        series: <CartesianSeries>[
                          
                            ColumnSeries<ChartData, String>(
                              animationDuration: 2000,
                              enableTooltip: true, 
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.name,
                                yValueMapper: (ChartData data, _) => data.val,
                                // Map color for each data points from the data source
                                // pointColorMapper: (ChartData data, _) => data.color,
                                width: 0.4, 
                                // Spacing between the bars
                                spacing: 0.3 ,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                xAxisName: "Service",
                                color: Color(0xff034047),
                                
                            )
                        ]
                    )
                )   
          ;
    }
}


class ChartData{
  var name;
  double? val;
  ChartData({required this.name,required this.val});
}