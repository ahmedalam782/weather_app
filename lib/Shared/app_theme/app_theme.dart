import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xffDFECDB);
  static const Color darkPrimary = Color(0xff060E1E);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color blue = Colors.blue;

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: lightPrimary,
    cardTheme: CardTheme(
      color: white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: darkPrimary,
        ),
      ),
      margin: const EdgeInsets.all(10),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      foregroundColor: black,
      backgroundColor: blue,
      elevation: 0,
      iconTheme: IconThemeData(
        size: 25,
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontFamily: 'Pacifico',
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        color: black,
        fontSize: 30,
        fontFamily: 'Pacifico',
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.green,
        fontSize: 20,
        fontFamily: 'Pacifico',
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    cardTheme: CardTheme(
      color: darkPrimary,
      elevation: 0,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: lightPrimary,
          )),
    ),
    scaffoldBackgroundColor: darkPrimary,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      foregroundColor: white,
      backgroundColor: blue,
      elevation: 0,
      iconTheme: IconThemeData(
        size: 25,
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontFamily: 'Pacifico',
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        color: white,
        fontSize: 30,
        fontFamily: 'Pacifico',
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.green,
        fontSize: 20,
        fontFamily: 'Pacifico',
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
