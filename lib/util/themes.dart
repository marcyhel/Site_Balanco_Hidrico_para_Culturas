import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
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
      color: Colors.black,
    ),
    headline1: TextStyle(color: Colors.blueGrey[800]),
  ),
  bottomAppBarColor: Colors.blueGrey.withAlpha(50),
  iconTheme: IconThemeData(color: Colors.blueGrey),
  brightness: Brightness.light,
);

var darkThemeData = ThemeData(
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
