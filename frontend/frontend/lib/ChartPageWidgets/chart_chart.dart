
import 'package:flutter/material.dart';

class ChartChart extends StatelessWidget {
  final String apiUrl;
  const ChartChart({super.key, required this.apiUrl});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text("Chart Component"),
    );
  }
}
