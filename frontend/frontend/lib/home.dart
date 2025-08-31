import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text(
          "Welcome to My Flutter Applications",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
