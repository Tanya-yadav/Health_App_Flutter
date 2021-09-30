import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/calculator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Login.dart';
import 'Signup.dart';
import 'Start.dart';

 void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
    runApp(MyApp());
    }

      class MyApp extends StatelessWidget {
         @override
         Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF4A148C),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
       home: CalculatorScreen(),

       routes: <String,WidgetBuilder>{

       "Login" : (BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "start":(BuildContext context)=>Start(),
    },
    );
  }
}
