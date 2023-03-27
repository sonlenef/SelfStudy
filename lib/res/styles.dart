import 'package:flutter/cupertino.dart';

class Styles {
  Styles._();

  static TextStyle rubikStyle(
    double size,
    Color color,
    FontWeight fontWeight,
  ) {
    return TextStyle(
      fontFamily: 'Rubik',
      color: color,
      fontWeight: fontWeight,
      fontSize: size,
    );
  }
}
