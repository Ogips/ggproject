import 'package:filmstv/apps/bottom_bar.dart';
import 'package:filmstv/apps/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 62, 54, 54),
      ),
      home: SplashScreen(),
      // home: const BottomBar(index: 0,),

    );
  }

}