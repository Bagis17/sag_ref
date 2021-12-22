import 'package:flutter/material.dart';
import './appbar.dart';
Widget hero(){
  return Container(
    child: Stack(
      children: <Widget>[
        Image(image: NetworkImage('https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.lactualite.com%2F2014%2F08%2Fbanane.jpg&imgrefurl=https%3A%2F%2Flactualite.com%2Fsante-et-science%2Fune-banane-dopee%2F&tbnid=Pjal_88xeGctnM&vet=12ahUKEwirwo7-nOT0AhUC4RoKHVCCDK0QMygAegUIARDFAQ..i&docid=y5MWgtOihGqL2M&w=600&h=450&itg=1&q=banane&ved=2ahUKEwirwo7-nOT0AhUC4RoKHVCCDK0QMygAegUIARDFAQ'),), //This
        // should be a paged
        // view.
        Positioned(child: appBar(),top: 0,),
        Positioned(child: FloatingActionButton(
            elevation: 2,
            /*child:Image(
              image: NetworkImage('https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.lactualite.com%2F2014%2F08%2Fbanane.jpg&imgrefurl=https%3A%2F%2Flactualite.com%2Fsante-et-science%2Fune-banane-dopee%2F&tbnid=Pjal_88xeGctnM&vet=12ahUKEwirwo7-nOT0AhUC4RoKHVCCDK0QMygAegUIARDFAQ..i&docid=y5MWgtOihGqL2M&w=600&h=450&itg=1&q=banane&ved=2ahUKEwirwo7-nOT0AhUC4RoKHVCCDK0QMygAegUIARDFAQ'),
              width: 30,
              height: 30,),*/
            backgroundColor: Colors.white,
            onPressed: (){}
        ),
          bottom: 0,
          right: 20,
        ),

      ],
    ),
  );
}