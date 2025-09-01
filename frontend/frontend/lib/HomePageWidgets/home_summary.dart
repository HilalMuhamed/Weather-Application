import 'package:flutter/material.dart';

class HomeSummary extends StatelessWidget {
  const HomeSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text("Temperature Summary"),
    );
  }
}