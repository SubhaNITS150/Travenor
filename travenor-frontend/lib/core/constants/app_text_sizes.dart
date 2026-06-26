
import 'package:flutter/cupertino.dart';

class AppSizes {
  // Font sizes
  static const double small = 12;
  static const double medium = 16;
  static const double large = 20;
  static const double xlarge = 30;

  // Padding / spacing
  static const double paddingSmall = 8;
  static const double paddingMedium = 16;
  static const double paddingLarge = 24;

  // Radius
  static const double radius = 12;

  // Font Weights
  static const xthin = FontWeight.w200;
  static const thin = FontWeight.w300;
  static const light = FontWeight.w400;
  static const bold = FontWeight.w600;
  static const xbold = FontWeight.w800;

  // Device sizes
  static double height(BuildContext context) => 
    MediaQuery.of(context).size.height;
  static double width(BuildContext context) => 
    MediaQuery.of(context).size.width;

  // Fractions
  static double heightFraction(BuildContext context, double fraction) => 
    MediaQuery.of(context).size.height * fraction;
  static double widthFraction(BuildContext context, double fraction) => 
    MediaQuery.of(context).size.width * fraction;
}