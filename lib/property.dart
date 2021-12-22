import 'package:flutter/material.dart';
Widget Property(){
  return Container(
    padding: EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Color"),
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle
                  ),
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.all(5),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle
                  ),
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.all(5),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle
                  ),
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.all(5),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle
                  ),
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.all(5),
                ),
              ],)

          ],
        ),
        Column(
          children: <Widget>[
            Text("Size"),
            Text("10.1",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)
              ),
            )
          ],
        )
      ],),
  );
}