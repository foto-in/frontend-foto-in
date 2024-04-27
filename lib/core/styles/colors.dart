import 'package:flutter/material.dart';

abstract class AppColor {
  static const primary = _FotoInColor.blue;
  static const secondary = _FotoInColor.tosca;

  static const backgroundPrimary = Colors.white;
  static final backgroundSecondary = _FotoInColor.light.shade50;
  static final backgroundTertiary = _FotoInColor.light.shade100;

  static const textPrimary = Color(0xff1f2328);
  static const textSecondary = Color(0xff5C707E);
  static const textTeriary = Color(0xffCAD2D7);
  static final blackWithOpacity = const Color(0xff000000).withOpacity(0.1);

  static const Color textFieldBackground = Color(0xffF4F6F7);
  static const Color textFieldBorder = Color(0xffF4F4F6);

  static final red600 = _FotoInColor.red.shade600;
  static final green600 = _FotoInColor.green.shade600;
}

abstract class _FotoInColor {
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
  static const int _toscaPrimaryValue = 0xffeefffa;

  static const MaterialColor tosca = MaterialColor(_toscaPrimaryValue, {
    50: Color(_toscaPrimaryValue),
    100: Color(0xffc4fff2),
    200: Color(0xff8affe6),
    300: Color(0xff47ffda),
    400: Color(0xFF1ff0ca),
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

  static const int _lightPrimaryValue = 0xff788B98;

  static const MaterialColor light = MaterialColor(_lightPrimaryValue, {
    50: Color(0xffF4F6F7),
    100: Color(0xffE3E8EA),
    200: Color(0xffCAD2D7),
    300: Color(0xffA4B2BC),
    400: Color(_lightPrimaryValue),
    500: Color(0xff5C707E),
    600: Color(0xff4F5D6B),
    700: Color(0xff455059),
    800: Color(0xff3D454D),
    900: Color(0xff363B43),
    950: Color(0xff1F2328),
  });

  static const int _greenPrimaryValue = 0xff00B943;

  static const MaterialColor green = MaterialColor(_greenPrimaryValue, {
    50: Color(0xffE6F9E6),
    100: Color(0xffC0F0C0),
    200: Color(0xff8CE68C),
    300: Color(0xff5AD95A),
    400: Color(0xff2FBE2F),
    500: Color(_greenPrimaryValue),
    600: Color(0xff00A200),
    700: Color(0xff008A00),
    800: Color(0xff007300),
    900: Color(0xff005B00),
    950: Color(0xff003200),
  });

  static const int _redPrimaryValue = 0xffE71735;

  static const MaterialColor red = MaterialColor(_redPrimaryValue, {
    50: Color(0xffFCE8EB),
    100: Color(0xffF8C2CC),
    200: Color(0xffF18A97),
    300: Color(0xffE85362),
    400: Color(0xffE12A3A),
    500: Color(_redPrimaryValue),
    600: Color(0xffC9001A),
    700: Color(0xffA80016),
    800: Color(0xff8A0012),
    900: Color(0xff6E000F),
    950: Color(0xff3A0008),
  });
}
