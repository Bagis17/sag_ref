import 'dart:js';

import 'package:flutter/material.dart';
Widget appBar(){
  return Container(
    padding: EdgeInsets.all(16),
    width: 800,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        //Image.asset("images/pomme.jpg"),
        Image(
          image: NetworkImage('https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.lactualite.com%2F2014%2F08%2Fbanane.jpg&imgrefurl=https%3A%2F%2Flactualite.com%2Fsante-et-science%2Fune-banane-dopee%2F&tbnid=Pjal_88xeGctnM&vet=12ahUKEwirwo7-nOT0AhUC4RoKHVCCDK0QMygAegUIARDFAQ..i&docid=y5MWgtOihGqL2M&w=600&h=450&itg=1&q=banane&ved=2ahUKEwirwo7-nOT0AhUC4RoKHVCCDK0QMygAegUIARDFAQ'),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text("MEN'S ORIGINAL",style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 14
              ),),
              Text("Smiths Shoes", style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)
              ),),
            ],
          ),
        ),
        //Image.asset("images/pomme.jpg", width: 27, height: 30,),
        /*Image(
          image: NetworkImage('https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.lactualite.com%2F2014%2F08%2Fbanane.jpg&imgrefurl=https%3A%2F%2Flactualite.com%2Fsante-et-science%2Fune-banane-dopee%2F&tbnid=Pjal_88xeGctnM&vet=12ahUKEwirwo7-nOT0AhUC4RoKHVCCDK0QMygAegUIARDFAQ..i&docid=y5MWgtOihGqL2M&w=600&h=450&itg=1&q=banane&ved=2ahUKEwirwo7-nOT0AhUC4RoKHVCCDK0QMygAegUIARDFAQ'),
          width: 27,
          height: 30,
        ),*/
        ],
    ),
  );
}