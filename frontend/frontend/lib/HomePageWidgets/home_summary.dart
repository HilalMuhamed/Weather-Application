import 'package:flutter/material.dart';

class HomeSummary extends StatelessWidget {
  final String apiUrl;
  const HomeSummary({super.key, required this.apiUrl});
  
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text("Temperature Summary"),
    );
  }
}