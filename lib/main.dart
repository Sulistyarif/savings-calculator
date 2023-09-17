import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savings_calculator/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        scaffoldBackgroundColor: Colors.teal[50],
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
    );
  }
}
