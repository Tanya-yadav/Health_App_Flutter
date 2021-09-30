import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';


// ignore: camel_case_types
class guidepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HEALTHVIO'),
        ),
        body:Container(
          //SingleChildScrollView(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             // crossAxisAlignment: CrossAxisAlignment.stretch,
        //padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5,),
            child: ListView(
              children: <Widget>[
                Image.asset('images/tenor.gif',  height: 170,width: 170,),
          Expanded(
          child: Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.topLeft,
               child: Text(
            'Welcome to your Healthy Guide',
            style: kTitleTextStyle,

          ),
        ),
    ),

    Expanded(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text ("UnderWeight",
    style:kLargeButtonTextStyle,),
      Image.asset('images/Anim.gif', height: 150,width: 150,),
    Text(
    "\nFoods and supplements-:\n",
    style:kResultTextStyle,),
      Text(
    ".Milk,Protein shakes,Rice,Red meat,Nuts and nut butter,Whole-grain breads,Starches.\n",
        style: kBodyTextStyle,),
    Text(
    "\nExercises-:\n",
      style:kResultTextStyle,),
    Text(
    "\nPushups ",
      style: kBodyTextStyle,),
     Image.asset('images/pushups.gif',height:200 ,width: 200,),
      Text(
        "\nPullups ",
        style: kBodyTextStyle,),
      Image.asset('images/pullups.gif',height:200 ,width: 200,),
      Text(
        "\nSquats ",
        style: kBodyTextStyle,),
      Image.asset('images/squats.gif',height:200 ,width: 200,),
      Text(
        "\nLunges ",
        style: kBodyTextStyle,),
      Image.asset('images/lunges.gif',height:200 ,width: 200,),


      Text(
        "Pushups,Pullups,Squats,Lunges, Bench Press,Overhead Press .\n ",
        style: kBodyTextStyle,),


      Text(
    "\nProblems-:\n",
      style:kResultTextStyle,),
    Text(
    "Delayed growth, Fragile bones, Weakened Immune, Anemia, Fertility issues,Hair loss",
    style: kBodyTextStyle,
    ),


      Text ("\nOverWeight",
        style:kLargeButtonTextStyle,),
      Image.asset('images/fitness.gif', height: 150,width: 150,),
    Text(
      "\nFoods and supplements-:\n",
      style:kResultTextStyle,),
      Text(
        "Beans,More Vegetables and Fruits,Apple,Yougurt,GrapeFruit.\n",
        style: kBodyTextStyle,),
      Text(
        "\nExercises-:\n",
        style:kResultTextStyle,),

      Text(
        "\nPushups ",
        style: kBodyTextStyle,),
      Image.asset('images/pushups.gif',height:200 ,width: 200,),
      Text(
        "\nBridges ",
        style: kBodyTextStyle,),
      Image.asset('images/bridges.gif',height:200 ,width: 200,),
      Text(
        "\nSquats ",
        style: kBodyTextStyle,),
      Image.asset('images/squats.gif',height:200 ,width: 200,),
      Text(
        "\nSide Leg Lifts",
        style: kBodyTextStyle,),
      Image.asset('images/sideleglift.gif',height:200 ,width: 200,),

      Text(
        "\nWalking and gyming,Riding Bicyle,Knee Lifts would also surely help.\n ",
        style: kBodyTextStyle,),
      Text(
        "\nProblems-:\n",
        style:kResultTextStyle,),
      Text(
        "Cardiovascular disorders,Diabetes,Hypertension,Chronic back pain,Osteoarthritis,Depression",
        style: kBodyTextStyle,
      ),

    ])),
           Expanded(
       child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             Text ("\n\nMacronutrients Chart\n",
               style:kLargeButtonTextStyle,),
             Image.asset('images/macro.jpg' ),

           ]
       ))
        ])));
  }}