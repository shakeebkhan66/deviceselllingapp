import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';


// this is a way to design our own theme separately
class MyTheme{
  static ThemeData LightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme
      )
  );
  static ThemeData DarkTheme(BuildContext context) => ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: Theme.of(context).textTheme,
    ),
  );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
  static Color darkCreamColor = Colors.black87;
  static Color lightBluishColor = Vx.indigo700;
}

