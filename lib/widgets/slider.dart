import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Slider23 extends StatefulWidget {
   List<String> imgs;
   Slider23({super.key,required this.imgs});

  @override
  State<Slider23> createState() => _Slider23State();
}

class _Slider23State extends State<Slider23> {
  @override
  
  late PageController _pageController;
  int activeIndex = 0;
 

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }
 int activePage = 0;
@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imgs.length, 
          itemBuilder: (context,index,realIndex){
            final img = widget.imgs[index];
            return buildImage(img,index);
          }, 
          options: CarouselOptions(   
            height: 200.h,
            autoPlay: true,
            reverse: true,
            autoPlayInterval: Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          )),
          SizedBox(height: 10.h,),
          buildIndicator()
      ],
    );

      
  }
  Widget buildImage(String img , int index)=> Container(
        color: Colors.grey,
        child:  Image.network(img,fit: BoxFit.cover,width:double.infinity,),
      );
  Widget buildIndicator()=> AnimatedSmoothIndicator( 
    activeIndex:activeIndex, count: widget.imgs.length,
    effect:  JumpingDotEffect(
      dotHeight: 5.h,
      dotColor: Color(0xffafc4dd),
      dotWidth: 5.w,
      activeDotColor: Color(0xff164584)
    ),
    
    
   );   
}