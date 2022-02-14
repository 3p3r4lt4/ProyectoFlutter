import 'package:flutter/material.dart';
import 'package:flxtech/core/theme/colors_app.dart';

abstract class TextStyleApp {
  static TextStyle h4() => TextStyle(
    color: darkColor,
    fontSize: 28,
    height: 1.215,
  );
  static TextStyle h3() => TextStyle(
    color: darkColor,
    fontSize: 24,
    height: 1.3,
  );
  static TextStyle h2() => TextStyle(
    color: darkColor,
    fontSize: 20,
    height: 1.4,
  );
  static TextStyle h1() => TextStyle(
    color: darkColor,
    fontSize: 18,
    height: 1.5,
  );
  static TextStyle b1() => TextStyle(
    color: primaryColor, //Envio Gratis
    fontSize: 16,
    height: 1.5,
  );
  static TextStyle b2() => TextStyle(
    color: darkColor, // Frexer description
    fontSize: 14,
    height: 1.4,
  );
  static TextStyle caption() => TextStyle(
    color: darkColor, //categories
    fontSize: 14,
    height: 1,
  );
}