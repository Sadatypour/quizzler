import 'package:flutter/material.dart';
import 'package:quizzler/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Courgette-Regular"),
      home: home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
