import 'package:flutter/material.dart';

//Lucky place Colors class
class LPColors {
  static var primaryDarkBlue = "#121A25".getColor;
  static var white = "#FFFFFF".getColor;
  static var grey1 = "#ADA8B8".getColor;
  static var grey2 = "#2C3039".getColor;
  static var grey3 = "#979797".getColor;
  static var grey4 = "#3B404B".getColor;
  static var grey5 = "#948EA2".getColor;
  static var grey6 = "#E1E0E3".getColor;
  static var grey7 = "#484451".getColor;
  static var grey8 = "#656567".getColor;

  static var green1 = "#18E68E".getColor;

  static var gradientImageColor1 = "#32364300".getColor;
  static var gradientImageColor2 = "#32364380".getColor;
}

extension getColorFromHex on String {
  Color get getColor {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    } else {
      return Colors.transparent;
    }
  }
}
