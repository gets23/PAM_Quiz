import 'package:flutter/material.dart';
import 'pages/MainWrapper.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Mobile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Memanggil MainWrapper untuk Bottom Navigation
      home: const MainWrapper(), 
      debugShowCheckedModeBanner: false,
    );
  }
}