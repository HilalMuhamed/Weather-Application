import 'package:flutter/material.dart';

class HomeTrends extends StatelessWidget {
  final String apiUrl;
  const HomeTrends({super.key, required this.apiUrl});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text("Daily and Weekly Trends"),
    );
  }
}