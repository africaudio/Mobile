import 'package:abook/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//FONTS
ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkbgColor,
    textTheme: TextTheme(
      // headline1: const TextStyle(fontSize: 102.0, fontWeight: FontWeight.bold),
      // headline6: const TextStyle(fontSize: 306.0, fontStyle: FontStyle.italic),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        fontFamily: GoogleFonts.poppins().fontFamily,
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 24.0,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.purple,
      accentColor: AppColors.primaryPurple,
      brightness: Brightness.dark,
      backgroundColor: AppColors.darkbgColor,
    ).copyWith(
      secondary: AppColors.secondaryOrange,
    ));
