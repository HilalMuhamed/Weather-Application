import 'package:flutter/material.dart';
import 'package:frontend/HomePageWidgets/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Application',  
      debugShowCheckedModeBanner: false,
      home:  MyHome(),
      
    );
  }
}
