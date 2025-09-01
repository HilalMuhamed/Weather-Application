
// chart_details.dart
import 'package:flutter/material.dart';

class ChartDetails extends StatelessWidget {
  final String apiUrl;
  const ChartDetails({super.key, required this.apiUrl});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text("Chart Details"),
    );
  }
}
