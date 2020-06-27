import 'package:flutter/material.dart';

final ThemeData rcsTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  backgroundColor: Color(0xFF19A765),
  primaryColor: Color(0xFF22975C),
  accentColor: Color(0xFF17D5BF),
  colorScheme: ColorScheme(
    primary: Color(0xFF22975C),
    primaryVariant: Color(0xFFbbedc4),
    secondary: Color(0xFFcae0d0),
    secondaryVariant: Color(0xFFe8fced),
    surface: Color(0xFFbbedc4),//Color(0xFF202945),
    background: Color(0xFF19A765),
    error: Color(0xFF22975C),
    onPrimary: Color(0x284730),
    //0xFF85A4BD
    onSecondary: Color(0x284730),
    //0xFF85A4BD
    onSurface: Color(0xFFa6bfad),
    onBackground: Color(0xddebe0),
    onError: Colors.deepOrange,
    brightness: Brightness.light,
  ),
);
