import 'package:flutter/material.dart';

Map<int, Color> BrandColor = {
  50: Color.fromRGBO(49, 45, 62, .1),
  100: Color.fromRGBO(49, 45, 62, .2),
  200: Color.fromRGBO(49, 45, 62, .3),
  300: Color.fromRGBO(49, 45, 62, .4),
  400: Color.fromRGBO(49, 45, 62, .5),
  500: Color.fromRGBO(49, 45, 62, .6),
  600: Color.fromRGBO(49, 45, 62, .7),
  700: Color.fromRGBO(49, 45, 62, .8),
  800: Color.fromRGBO(49, 45, 62, .9),
  900: Color.fromRGBO(49, 45, 62, 1),
};
Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

TextStyle labelTextStyle = const TextStyle(
  fontSize: 24,
  color: Color(0xff80D0C7),
);

TextStyle hintTextStyle = TextStyle(
  fontSize: 18,
  color: BrandColor[900],
);
