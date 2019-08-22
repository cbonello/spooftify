import 'package:flutter/material.dart';

// https://material.io/tools/color/#!/?view.left=0&view.right=0&primary.color=2d3d54&secondary.color=2E7D32
ThemeData buildTheme() {
  const Color _PRIMARY = Color(0xFF2D3D54);
  const Color _PRIMARY_LIGHT = Color(0xFF586781);
  const Color _PRIMARY_DARK = Color(0xFF03172B);
  const Color _SECONDARY = Color(0xFF2E7D32);
  // const Color _SECONDARY_LIGHT = Color(0xFF60AD5E);
  // const Color _SECONDARY_DARK = Color(0xFF005005);
  // const Color _BACKGROUND_LIGHT = Color(0xFFF5F5F6);
  // const Color _BACKGROUND_DARK = Color(0xFFE1E2E1);

  TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      display1: base.display1.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      body1: base.body1.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      caption: base.caption.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: _PRIMARY,
    primaryColorLight: _PRIMARY_LIGHT,
    primaryColorDark: _PRIMARY_DARK,
    primaryColorBrightness: Brightness.dark,
    accentColor: _SECONDARY,
    accentColorBrightness: Brightness.dark,
    // backgroundColor: _BACKGROUND_LIGHT,
    // bottomAppBarColor: _PRIMARY,
    // buttonColor: _SECONDARY,
    // canvasColor: _PRIMARY,
    // cardColor: Colors.white,
    // cursorColor: _SECONDARY,
    // dividerColor: _BACKGROUND_LIGHT,
    // textSelectionColor: Colors.white,
    // unselectedWidgetColor: Colors.white,
    textTheme: _buildTextTheme(base.textTheme),
  );
}

// ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: Colors.lightBlue[800],
//   accentColor: Colors.cyan[600],
//   fontFamily: 'Montserrat',
//   textTheme: TextTheme(
//     display1: TextStyle(
//       fontSize: 26,
//       fontWeight: FontWeight.bold,
//       color: Colors.white,
//     ),
//     body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
//   ),
// ),
