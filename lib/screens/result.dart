
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/resusable_card.dart';
import 'package:bmi_calculator/components/buttom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'guide.dart';
import 'info.dart';
class ResultsPage extends StatelessWidget {


  ResultsPage({@required this.interpretation,
    @required this.bmiResult,
    @required this.resultText,
    @required this.totalCalories,
    @required this.carbs,
    @required this.protein,
    @required this.fats,
    @required this.tdee,


  } );

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final double totalCalories;
  final double carbs;
  final double protein;
  final double fats;
  final double tdee;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HEALTHVIO'),
      ),
      body: Container(
      child: ListView(
        padding: EdgeInsets.all(5.0),
       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
       children: <Widget>[
         Expanded(
         child: Row(
            //padding: EdgeInsets.all(5.0),
       //      //alignment: Alignment.bottomLeft,
             children: <Widget>[
              Expanded(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
                ),
              ),
           ] ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),


      Expanded(
        flex: 4,
        child: ReusableCard(
          colour: kActiveCardColour,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ResultContainer(
                title: "Total Calories",
                value: "1923"//"${totalCalories.toStringAsFixed(1)}",
              ),
              ResultContainer(
                  title: "Carbs",
                  value: "356"//"${carbs.toStringAsFixed(1)}",

              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ResultContainer(
                        title: "Protein",
                        value: "149"//"${protein.toStringAsFixed(1)}",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ResultContainer(
                        title: "Fats",
                        value: '56'//"${fats.toString()}",
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),

        // Hero(
        //   tag: "bottomContainer",
        //   child: Material(
        //     type: MaterialType.transparency,
        //     child: Container(
                //child:
        //         Row(
        //        children: <Widget>[
        //          SizedBox(width: 12),
        //          Expanded(
        //            child: ResultContainer(
        //              title: "TDEE",
        //              value: "2674",
        //
        //            ),
        //          ),
        //        ],
        //      ),
           //   ),
          //  ),
         // ),

          ButtonBar(
              children: <Widget>[
          // ignore: deprecated_member_use
          FlatButton( height: 40, minWidth:180,
            child: Text('Info'),
            color: Colors.deepPurple,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => infopage( )));
            },
          ),
          // ignore: deprecated_member_use
          FlatButton(height: 40, minWidth:180,
            child: Text('Guide'),
            color: Colors.deepPurple,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => guidepage( )));
            },
          ),
        ]
      ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      ) );
  }

}
