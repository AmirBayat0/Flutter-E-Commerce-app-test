import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_test/view/splash.dart';
import 'package:google_fonts/google_fonts.dart';

//
// Created by CodeWithFlexZ
// Tutorials on my YouTube
//
//! Instagram
//! @CodeWithFlexZ
//
//? GitHub
//? AmirBayat0
//
//* YouTube
//* Programming with FlexZ
//

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter E-Commerce app test',
      home: const SplashScreen(),
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.normal,
          ),
          displayMedium: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: GoogleFonts.roboto(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          headlineSmall: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: GoogleFonts.roboto(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
