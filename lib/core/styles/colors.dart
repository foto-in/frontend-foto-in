import 'package:flutter/material.dart';

class AppColor {
  static const primary = Color(0xff041829);
  static const secondary = Color(0xff1ff0ca);
  static const textPrimary = Color(0xff3D3D3D);
  static const textSecondary = Color(0xff5C707E);
  static const textTeriary = Color(0xffCAD2D7);
  static final blackWithOpacity = const Color(0xff000000).withOpacity(0.1);

  static const Color textFieldBackground = Color(0xffF4F6F7);
  static const Color textFieldBorder = Color(0xffF4F4F6);
}

class FotoInColor {
  // Blue
  static const int _bluePrimaryValue = 0xff041829;

  static const MaterialColor blue = MaterialColor(_bluePrimaryValue, {
    50: Color(0xfff0f8ff),
    100: Color(0xffe0f0fe),
    200: Color(0xffb9e2fe),
    300: Color(0xff7bccfe),
    400: Color(0xff36b2fa),
    500: Color(0xFF0b99ec),
    600: Color(0xff0079c9),
    700: Color(0xff0160a3),
    800: Color(0xff055187),
    900: Color(0xff0b446f),
    950: Color(_bluePrimaryValue),
  });

  // Tosca
  static const int _toscaPrimaryValue = 0xFF1ff0ca;

  static const MaterialColor tosca = MaterialColor(_toscaPrimaryValue, {
    50: Color(0xffeefffa),
    100: Color(0xffc4fff2),
    200: Color(0xff8affe6),
    300: Color(0xff47ffda),
    400: Color(_toscaPrimaryValue),
    500: Color(0xff00d3af),
    600: Color(0xff00aa90),
    700: Color(0xff008774),
    800: Color(0xff046b5e),
    900: Color(0xff09584e),
    950: Color(0xff003632),
  });

  // Yellow
  static const int _yellowPrimaryValue = 0xffFBBE0C;

  static const MaterialColor yellow = MaterialColor(_yellowPrimaryValue, {
    50: Color(0xffFFFDEA),
    100: Color(0xffFFFBC6),
    200: Color(0xffFFF687),
    300: Color(0xffFFEA49),
    400: Color(0xffFFDB1F),
    500: Color(_yellowPrimaryValue),
    600: Color(0xffDE9101),
    700: Color(0xffB86705),
    800: Color(0xff954F0B),
    900: Color(0xff7B410C),
    950: Color(0xff472101),
  });
}
