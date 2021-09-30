import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

// ignore: camel_case_types
class infopage extends StatelessWidget {

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('HEALTHVIO'),
    ),
   body: Container(
   child: ListView(
  padding: EdgeInsets.all(5.0),
       children: <Widget>[
   Expanded(
 //     flex: 3,
 //     child:
 //
 //     Image.asset ('images/bmi-chart.gif',
 //     alignment: Alignment.center,  ),
 //     //child: Text('HEALTHVIO'),
 //     ),
 //      Expanded(child: Image.asset('images/unnamed.jpg'),
 //
 //      ),
 //       ])
 //
 // )


    child: Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      Text ("BMI Chart",
      style:kLargeButtonTextStyle,),
    Image.asset('images/bmi-chart.gif', alignment: Alignment.center, ),
    Text(
      "\nCalorie Chart",
      style:kLargeButtonTextStyle,),
        Image.asset('images/unnamed.jpg', alignment: Alignment.center, ),
   ])
)]
   )));
}}