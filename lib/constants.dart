import 'package:flutter/material.dart';

const kBottomContainerHeight = 50.0;

const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0xFF111328);
const kBottomContainerColour = Color(0xFF4A148C);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,

  color:  Color(0xFF8D8E98),
);

const kNumberTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 26.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFFB39DDB),
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);
@override
class ResultContainer extends StatelessWidget {
  const ResultContainer({
    Key key,
    @required this.title,
    @required this.value,

  }) : super(key: key);

  final String title;
  final String value;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(1, 3),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(
            title,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(value,
              ),

            ],
          )
        ],
      ),
    );
  }
  }
  class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
  @required RenderBox parentBox,
  Offset offset = Offset.zero,
  @required SliderThemeData sliderTheme,
  bool isEnabled = false,
  bool isDiscrete = false,
  }) {
  final double trackHeight = sliderTheme.trackHeight;
  final double trackLeft = offset.dx;
  final double trackTop =
  offset.dy + (parentBox.size.height - trackHeight) / 2;
  final double trackWidth = parentBox.size.width;
  return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
  }
