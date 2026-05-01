import 'package:flutter/material.dart';
import 'package:assignment/screens/home_screen.dart';

void main() {
  runApp(const SafaraApp());
}

class SafaraApp extends StatelessWidget {
  const SafaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safara',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF00061E),
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF34C759),
          secondary: Color(0xFF007AFF),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
