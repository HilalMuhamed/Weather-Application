import 'package:flutter/material.dart';


class WeeklyWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const WeeklyWidget({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Weekly Widget")
    );
  }
}
