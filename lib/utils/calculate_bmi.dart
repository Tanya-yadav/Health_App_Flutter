import 'dart:math';
import 'package:bmi_calculator/screens/calculator.dart';

class BmiLogic {
  BmiLogic({this.height, this.weight, this.age,});

  final int height;
  final int weight;
  final double age;


  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  double bmr() {
    if (selectedGender == Gender.male) {
      return 10 * weight + 6.25 * height - 5* age  + 5;
    } else {
      return 10 * weight + 6.25 * height - 5 * age - 161;
    }
  }
  double tdee(){
    if (selectedActivityLevel == ActivityLevel.sedentary)
      return bmr() * 1.2;
    else if (selectedActivityLevel == ActivityLevel.lightlyActive)
      return bmr() * 1.375;
    else if (selectedActivityLevel == ActivityLevel.moderatelyActive)
      return bmr() * 1.55;
    else if (selectedActivityLevel == ActivityLevel.veryActive)
      return bmr() * 1.725;
    else if (selectedActivityLevel == ActivityLevel.extremlyActive)
      return bmr() * 1.9;
    else
      return null;
  }

  double totalCalories() {
    if (selectedGoal == Goal.looseWeight) {
      return tdee() - 500;
    } else if (selectedGoal == Goal.maintainWeight) {
      return tdee();
    } else if (selectedGoal == Goal.gainWeight) {
      return tdee() + 400;
    } else
      return null;
  }

  //protein
  double protein() {
    if (selectedGoal == Goal.looseWeight) {
      return loPro() / 4;
    } else if (selectedGoal == Goal.maintainWeight) {
      return mnPro() / 4;
    } else if (selectedGoal == Goal.gainWeight) {
      return gnPro() / 4;
    }
    return null;
  }

  //fats
  double fat() {
    if (selectedGoal == Goal.looseWeight) {
      return loFat() / 9;
    } else if (selectedGoal == Goal.maintainWeight) {
      return mnFat() / 9;
    } else if (selectedGoal == Goal.gainWeight) {
      return gnFat() / 9;
    }
    return null;
  }

  //carbs
  double carb() {
    if (selectedGoal == Goal.looseWeight) {
      return loCarb() / 4;
    } else if (selectedGoal == Goal.maintainWeight) {
      return mnCarb() / 4;
    } else if (selectedGoal == Goal.gainWeight) {
      return gnCarb() / 4;
    }
    return null;
  }

  double loPro() {
    return (1.1 * (weight * 2.2)) * 4;
  }

  double loFat() {
    return 0.20 * totalCalories();
  }

  double loCarb() {
    return (totalCalories() - (loFat() + loPro()));
  }

  //maintain weight
  double mnPro() {
    return (weight * 2.2) * 4;
  }

  double mnFat() {
    return 0.20 * totalCalories();
  }

  double mnCarb() {
    return totalCalories() - (mnPro() + mnFat());
  }

  //gain weight
  double gnPro() {
    return (0.9 * (weight * 2.2)) * 4;
  }

  double gnFat() {
    return 0.25 * totalCalories();
  }

  double gnCarb() {
    return totalCalories() - (gnFat() + gnPro());
  }



  String getResult() {
    if(_bmi >=35) {
        return'Obese Class2';
      }
    else if (_bmi >= 30 && _bmi <=34.9){
      return 'Obese Class 1';
    }
    else if (_bmi >= 25 && _bmi <=29.9) {
      return 'Overweight';
    }
    else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'Normal';
    }
    else if (_bmi <= 18.4 && _bmi > 17) {
      return 'Mild Thinness';
    }
    else {
      return 'Severe Thinness';
    }
  }

  String getInterpretation() {

    if(_bmi >=35) {
      return
      "Tips-:\n"
        "Consume less bad fat and more good fat.\n"
            "Consume less processed,sugary foods.\n"
            " Eat plenty of dietary fiber.\n "
          "Engage in regular aerobic activity.\n"
      "#STAYHEALTHY";
    }
    else if (_bmi >= 30 && _bmi <=34.9){
       return "Tips-:\n"
           "Consume less bad fat and more good fat.\n"
           "Consume less processed,sugary foods.\n"
           " Eat plenty of dietary fiber.\n "
           "Engage in regular aerobic activity.\n"
           "#STAYHEALTHY";
    }
    else if (_bmi >= 25 && _bmi <=29.9) {
      return "Tips-:\n"
          "Consume less bad fat and more good fat.\n"
          "Consume less processed,sugary foods.\n"
          " Eat plenty of dietary fiber.\n "
          "Engage in regular aerobic activity.\n"
          "#STAYHEALTHY";
    }
    else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return "YAYYYYYY\n"
             "You are Healthy\n"
             "So proud of you.Keep it up.\n"
          "#STAYHEALTHY";
    }
    else if (_bmi <= 18.4 && _bmi > 17) {
      return  "Tips-:\n"
        "Eat more frequently.\n"
     "Choose nutrient-rich foods.\n"
    "Try smoothies and shakes.\n"
    "Have an occasional treat.\n"
    "Exercise.\n"
          "#STAYHEALTHY";
    }
    else {
      return  "Tips-:\n"
        "Eat more frequently.\n"
          "Choose nutrient-rich foods.\n"
          "Try smoothies and shakes.\n"
          "Have an occasional treat.\n"
          "Exercise.\n"
          "#STAYHEALTHY";
    }
  }
  }
