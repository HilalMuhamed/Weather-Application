
import 'package:flutter/material.dart';

class ReportTrends extends StatelessWidget {
  final String apiUrl;
  const ReportTrends({super.key, required this.apiUrl});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text("Report Trends "),
    );
  }
}
