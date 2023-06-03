





import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vendorapp/screens/mainhome.dart';

import 'package:vendorapp/screens/postTask/details.dart';
import 'package:vendorapp/screens/privacyPolicy.dart';
import 'package:vendorapp/screens/profile.dart';
import 'package:vendorapp/screens/service_provider.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/heading2.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendorapp/screens/mainhome.dart';
import 'package:vendorapp/screens/signin.dart';
import 'package:vendorapp/widgets/heading2.dart';

import 'package:flutter/material.dart';

import '../chatApp/allchatPersons.dart';
import '../mainCredit/user_wallet.dart';
import '../provider/provider1.dart';
import '../widgets/title4.dart';
import 'notifications.dart';
import 'orderStatus/mainScreen.dart';
import 'orders/postsScreen.dart';



class MyApp1 extends StatelessWidget {
  List<String> pics;
  MyApp1({super.key,required this.pics});
  Widget build(BuildContext context) {
    return  MyHomePage(pics: pics,);
      
  }
}

class MyHomePage extends StatefulWidget {
  List<String> pics;
  MyHomePage({super.key,required this.pics});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
 late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        final Provider11 = Provider.of<Provider1>(context); 
        final _dialog = RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rate Us',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Please rate our provided app services with star',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      enableComment: false,
      image: Image.asset("assets/images/logopng.png"),
      submitButtonText: 'Submit',
      onSubmitted: (response) {
        FirebaseFirestore.instance.collection("in_app_rating").doc(Provider11.uid).set({
          "rating":response.rating.toString(),
          "from":Provider11.fullname,
          "profile":Provider11.profile,
          "phone":Provider11.phone
        });
        print('rating: ${response.rating}, comment: ${response.comment}');

        // TODO: add your own logic
        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
          // _rateAndReviewApp();
        }
      },
    );

    // show the dialog
   
    return Scaffold(
       appBar: AppBar(

        iconTheme: IconThemeData(color: Color(0xff034047)),
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: Colors.pink,
                child: CircleAvatar(
                      radius: 22.r,
                      backgroundImage:
                          NetworkImage("${Provider11.profile}"),
                      backgroundColor: Colors.blue,
                    ),
              ),
              SizedBox(width: 5.w,),
              Column(
                children: [
                  Title4(heading: "${Provider11.fullname}", color: Color(0xff034047), weight: FontWeight.w600,),
                  
                ],
              )
            ],
          ),
        ),
      ),
           drawer: Drawer(  
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset("assets/images/logo2.jpg")
                ),
              SizedBox(height: 7.h,),
              Divider(
                color: Colors.white,
                height: 2.h,
              ),
              Container(
                color: Color(0xff034047),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 7.w),
                  child: Container(
                    color: Color(0xff034047),
                    child: Column(children: [
                    SizedBox(height: 15.h,),  
                      GestureDetector(
                        onTap: (){
                          
                     
                        Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UserProfile()),);
                   
                   
                        },
                        child: Row(
                                          children: [
                        Icon(Icons.person,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Heading2(color: Colors.white, heading: 'Profile',)
                                          ],
                                        ),
                      ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: (){
                     
                        Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UserAllChatPerson()),);
                   
                    },
                    child: Row(
                      children: [
                        Icon(Icons.chat,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Heading2(color: Colors.white, heading: 'Chat',)
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: (){
                        Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PostScreen()),);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.luggage,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Heading2(color: Colors.white, heading: 'Order',)
                      ],
                    ),
                  ),
                   SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: (){
                        Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OrdersStatus()),);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.luggage,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Heading2(color: Colors.white, heading: 'Orders Status',)
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  SizedBox(height: 15.h,),
                  GestureDetector(
                    onTap: (){
                        Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => User_Wallet()),);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.money,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Heading2(color: Colors.white, heading: 'Wallet',)
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Icon(Icons.share,color: Colors.white,),
                      SizedBox(width: 10.w,),
                      Heading2(color: Colors.white, heading: 'ShareApp',)
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap:(){
 showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );
                    },
                    child: Row(
                      
                      children: [
                        Icon(Icons.star,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Heading2(color: Colors.white, heading: 'Rate us',)
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: (){
                      showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Contact Us"),
                  content: Container(
                    height: 140.h,
                    child:Column(
                      children: [
                        Row(
  children: [
    Icon(
      Icons.mail,
      color: Color(0xff034047),
    ),
    SizedBox(width: 5),
    Text(
      'Email Us: ',
      style: TextStyle(
        fontSize: 16,
      ),
    ),
   
  ],
),
SizedBox(height: 10.h,),
 Text(
      'Houseeasefyp2k23@gmail.com',
      style: TextStyle(
        fontSize: 16,
        color: Colors.blue,
        decoration: TextDecoration.underline,
      ),
    ),
    SizedBox(height: 20.h,),
Row(
  children: [
    Icon(
      Icons.phone,
      color: Color(0xff034047),
    ),
    SizedBox(width: 5),
    Text(
      'Contact Number: ',
      style: TextStyle(
        fontSize: 16,
      ),
    ),
   
  ],
),
SizedBox(height: 10.h,),
 Text(
      '######',
      style: TextStyle(
        fontSize: 16,
      ),
    ),

                      ],
                    )),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Color(0xff034047),
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay",style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                    ),
                  ],
                ),
              );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.phone,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Heading2(color: Colors.white, heading: 'Contact us',)
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: (){
                        Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PrivacyPolicy()),);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.privacy_tip,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Heading2(color: Colors.white, heading: 'Privacy',)
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    color: Colors.white,
                    height: 2.h,
                  ),
                    ]),
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup()),);
                            },
                            child: Row(children: [
                              Text("Log out"),
                              SizedBox(width: 5.w,),
                              Icon(Icons.logout_outlined)
                            ],),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff034047)),
                            ),
                          )),
              ),
             
            ],
            
          ),
         ) ,
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            MainHome(pics: widget.pics,),
            Notifications(),
            SearchBarScreen(),
            UserProfile(),
          ],
        ),
      ),
         floatingActionButton: FloatingActionButton(
          
          backgroundColor: Color(0xff034047),
        onPressed: (() {
          Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Details()),);
        }),
        tooltip: 'Increment',
        child: Icon(CupertinoIcons.briefcase),
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
      items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
            activeColor: Color(0xff034047),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.bell),
            title: Text('notifications'),
            activeColor: Color(0xff034047),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text(
              'Search',
            ),
            activeColor: Color(0xff034047),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.person),
            title: Text('Profile'),
            activeColor: Color(0xff034047),
            textAlign: TextAlign.center,
          ),
        ],
      ),
       
    );
  }
}







class SearchBarScreen extends StatefulWidget {
  @override
  _SearchBarScreenState createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  final TextEditingController _searchController = TextEditingController();
  Stream<QuerySnapshot>? _searchResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchResults = searchFirestore(value);
                });
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _searchResults,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                final matchingDocs = snapshot.data?.docs
                    .where((doc) =>
                        doc.get('name').toString().toLowerCase().contains(_searchController.text.toLowerCase()))
                    .toList();

                if (matchingDocs == null || matchingDocs.isEmpty) {
                  return Text('No results found.');
                }

                return ListView.builder(
                  itemCount: matchingDocs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data = matchingDocs[index].data() as Map<String,dynamic>;
                    final title = data['name']?.toString() ?? '';
                    final description = data['description']?.toString() ?? '';

                    return GestureDetector(
                      onTap: () {
                         Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ServiceProvider(uno: '$title', nature: 'asset',)),);
                      },
                      child: ListTile(
                        title: Text(_capitalizeFirstLetter(title)),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  String capitalizeFirstLetter(String input) {
  if (input.isEmpty) return '';

  final firstLetter = input[0].toUpperCase();
  final remainingLetters = input.substring(1);

  return '$firstLetter$remainingLetters';
}

  Stream<QuerySnapshot> searchFirestore(String searchQuery) {
    final CollectionReference collection = FirebaseFirestore.instance.collection('get_services');

    return collection
        .where('name', isGreaterThanOrEqualTo: capitalizeFirstLetter(searchQuery))
        .orderBy('name')
        .snapshots();
  }

  String _capitalizeFirstLetter(String input) {
    if (input.isEmpty) return '';

    final List<String> words = input.split(' ');
    final capitalizedWords =
        words.map((word) => word[0].toUpperCase() + word.substring(1)).toList();
    return capitalizedWords.join(' ');
  }
}
