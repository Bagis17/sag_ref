import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sag_ref/form.dart';
import 'package:sag_ref/list.dart';
import './entete.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import'./main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  int activeIndex=0;
  double _headerHeight = 250;
  int index=1;
  final navigationKey =GlobalKey<CurvedNavigationBarState>();

  Key _formKey = GlobalKey<FormState>();
  final images=[
    'images/add.png',
    //'images/voiture3.png',
    'images/peugeot1.jpg',
    //'images/voiture1.png',
    'images/logo.png',
    'images/caisse.png',
    'images/facture1.png',
    'images/facture2.png',
     'images/stock.png'
  ];
    Widget buildImage(String image, int index)=>Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      //height: 300,
      //color: Colors.black,
      child:Stack(
        children: [
        Positioned.fill(
                child: ClipRRect(
                    child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(20.0,20.0),
                              blurRadius: 80.0,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                          color: Colors.white,
                          //borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Image.asset(image,fit: BoxFit.cover)),
                  borderRadius: BorderRadius.circular(20),

                )
            ),
        ],
      )

    );


  @override
  Widget build(BuildContext context) {
    final items=<Widget>[
      Icon(Icons.format_list_bulleted),
      Icon(Icons.home ),
      Icon(Icons.add)
    ];
    final pages=[
      Home(1,0),
      ProductsList(),
      ProductForm(0),

    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.home_rounded), //let's create a common header widget
            ),

            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Bienvenue',
                        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Réferencez vos produits rapidement!!!',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CarouselSlider.builder(
                                  options: CarouselOptions(height: 300,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    onPageChanged: (index,reason)=>setState(()=>activeIndex=index),
                                  ),
                                  itemCount: images.length,
                                  itemBuilder: (context,index,realIndex){
                                    final image=images[index];
                                    return buildImage(image,index);
                                  },
                              ),
                              const SizedBox(height: 32),
                              buildIndicator(),
                            ],
                          ),
                        ),
                      )

                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    bottomNavigationBar: Theme(
    data: Theme.of(context).copyWith(
    iconTheme: IconThemeData(
    color: Colors.white,
    )
    ),
    child: CurvedNavigationBar(
    color: Colors.black ,
    buttonBackgroundColor: Colors.black,
    backgroundColor: Colors.transparent,
    items: items,
    index: index,
    onTap: (index)=>setState(()=>this.index=index),

    ),
    ),
    );

  }

 Widget buildIndicator()=> AnimatedSmoothIndicator(
   activeIndex:activeIndex,
   count:images.length,
   effect:  WormEffect(
     activeDotColor: Colors.black
   ),
 );

}