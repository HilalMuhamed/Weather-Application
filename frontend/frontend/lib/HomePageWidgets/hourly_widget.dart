import 'package:flutter/material.dart';


class HourlyWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const HourlyWidget({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Hourly Widget")
    );
  }
}
