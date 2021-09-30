
import 'package:bmi_calculator/profile.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/buttom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/resusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/utils/calculate_bmi.dart';
import 'result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum Gender {
  male,
  female,
}
enum ActivityLevel {
  unDefined,
  sedentary,
  lightlyActive,
  moderatelyActive,
  veryActive,
  extremlyActive,
}

enum Goal {
  unDefined,
  looseWeight,
  maintainWeight,
  gainWeight,
}

Gender selectedGender = Gender.male;
ActivityLevel selectedActivityLevel;
Goal selectedGoal;

class CalculatorScreen extends StatefulWidget {
  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  Gender selectedGender;
  int height = 150;
  int weight = 50;
  int age = 20;

  List<String> activityLevels = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active',
    'Extremly Active'
  ];
  List<String> goals = ['Lose Weight', 'Maintain Weight', 'Gain Weight'];

  String activityLevelValue = 'Moderately Active';
  String goalValue = 'Maintain Weight';



  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final blockVertical = mediaQuery.size.height / 100;
    return Scaffold(
     //  key: _scaffoldKey,
     //  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
     //  floatingActionButton: FloatingActionButton(
     //      child: Icon(FontAwesomeIcons.check),
     //      onPressed: () {
     //        selectedActivityLevel = getActivityLevel();
     //        selectedGoal = getGoal();
     //      }),
        appBar: AppBar(
          title: Text('HEALTHVIO'),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon( Icons.share),
              onPressed: () {},),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {

              },
            ),
          ],
        ),

        body: Container(
          child: ListView(
            padding: EdgeInsets.all(1.0),
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('images/images.png', height: 120,width: 120,),
              Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          colour: selectedGender == Gender.male
                              ? kActiveCardColour
                              : kInactiveCardColour,
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.mars,
                            label: 'MALE',
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          colour: selectedGender == Gender.female
                              ? kActiveCardColour
                              : kInactiveCardColour,
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.venus,
                            label: 'FEMALE',

                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFFB39DDB),
                          activeTrackColor: Colors.deepPurple,
                          thumbColor: Color(0xFF4A148C),
                          overlayColor: Color(0xFFCE93D8),
                          thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 13.0),
                          overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'kg',
                              style: kLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),Text(
                              'years',
                              style: kLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(
                                          () {
                                        age--;
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              BottomButton(
                buttonTitle: 'CALCULATE',
                onTap: () {
                  BmiLogic calc =
                  BmiLogic(height: height, weight: weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                        totalCalories: calc.totalCalories(),
                        carbs: calc.carb(),
                        protein: calc.protein(),
                        fats: calc.fat(),
                        tdee: calc.tdee(),
                      ),
                    ),
                  );
                },
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child:
                Text(
                  //'BMI is used to define whether you are in healthy weight range\n'
                      '*This calculator should not be used for pregnant women or children',
                  style: kLabelTextStyle,
                ),
              ),
              Hero(
                tag: "bottomContainer",
                child: Material(
                  type: MaterialType.transparency,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Activity level",
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 25),
                            child: DropdownButton<String>(
                              value: activityLevelValue,
                              icon:
                              Icon(FontAwesomeIcons.caretDown),
                              iconSize: 18,
                              elevation: 4,
                              underline: Container(
                                height: 4,
                                color: Colors.deepPurple,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  activityLevelValue = newValue;
                                });
                              },
                              items: activityLevels
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,),
                                    );
                                  }).toList(),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Goal",
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left:25),
                            child: DropdownButton<String>(
                              value: goalValue,
                              icon:
                              Icon(FontAwesomeIcons.caretDown),
                              iconSize: 18,
                              elevation: 4,
                              underline: Container(
                                height: 4,
                                color: Colors.deepPurple,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  goalValue = newValue;
                                });
                              },
                              items: goals
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,),
                                    );
                                  }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),


              // ignore: deprecated_member_use
              RaisedButton(
                  child:
                  Text('Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                onPressed:  () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => profile()));
                }
                  ),
              // ignore: deprecated_member_use
              RaisedButton(
                padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                onPressed: signOut,
                child: Text('Signout',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              )
            ],
          ),
        ));
  }
  ActivityLevel getActivityLevel() {
    if (activityLevelValue == "Sedentary")
      return ActivityLevel.sedentary;
    else if (activityLevelValue == "Lightly Active")
      return ActivityLevel.lightlyActive;
    else if (activityLevelValue == "Moderately Active")
      return ActivityLevel.moderatelyActive;
    else if (activityLevelValue == "Very Active")
      return ActivityLevel.veryActive;
    else if (activityLevelValue == "Extremly Active")
      return ActivityLevel.extremlyActive;
    else
      return null;
  }

  Goal getGoal() {
    if (goalValue == "Lose Weight")
      return Goal.looseWeight;
    else if (goalValue == "Maintain Weight")
      return Goal.maintainWeight;
    else if (goalValue == "Gain Weight")
      return Goal.gainWeight;
    else
      return null;
  }

}
