import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
  textSelectionColor: Colors.black54,
  hintColor: Colors.blueGrey[600],
  hoverColor: Colors.blueGrey[100],
  primaryColor: Colors.grey,
  primarySwatch: Colors.blueGrey,
  backgroundColor: Colors.white,
  cardColor: Colors.white,
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey,
      decorationColor: Colors.blueGrey[300],
    ),
    subtitle2: TextStyle(
      color: Colors.blueGrey[900],
    ),
    subtitle1: TextStyle(
      color: Colors.black54,
    ),
    headline1: TextStyle(color: Colors.blueGrey[800]),
  ),
  bottomAppBarColor: Colors.blueGrey.withAlpha(50),
  iconTheme: IconThemeData(color: Colors.blueGrey),
  brightness: Brightness.light,
);

var darkThemeData = ThemeData(
  textSelectionColor: Colors.black87,
  hintColor: Colors.grey[900],
  hoverColor: Colors.blueGrey,
  primaryColor: Colors.grey,
  primarySwatch: Colors.blueGrey,
  backgroundColor: Colors.blueGrey[900],
  cardColor: Colors.blueGrey[800],
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
    subtitle2: TextStyle(
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      color: Colors.blueGrey[300],
    ),
    headline1: TextStyle(
      color: Colors.white70,
    ),
  ),
  bottomAppBarColor: Colors.blueGrey[700],
  iconTheme: IconThemeData(color: Colors.blueGrey[200]),
  brightness: Brightness.dark,
);
