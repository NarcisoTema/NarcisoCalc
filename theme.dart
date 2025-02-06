import 'package:flutter/material.dart';

class AppTheme {
  static const Color blueNormal = Color(0xFF005C99); // Azul normal
  static const Color blueLoaded = Color(0xFF3399FF); // Azul carregada
  static const Color backgroundColor = Color(0xFFF5F5F5); // Cor de fundo suave
  static const Color buttonTextColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: blueNormal,
    accentColor: blueLoaded,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      color: blueNormal,
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: buttonTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: blueLoaded,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: blueLoaded,
        onPrimary: buttonTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(20),
      ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black, fontSize: 18),
      bodyText2: TextStyle(color: Colors.black54, fontSize: 16),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: blueNormal),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    iconTheme: IconThemeData(
      color: blueNormal,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: blueLoaded,
    ),
  );
}
