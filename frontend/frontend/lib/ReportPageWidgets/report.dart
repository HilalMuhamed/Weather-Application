import 'package:flutter/material.dart';
import 'package:frontend/ReportPageWidgets/report_details.dart';
import 'package:frontend/ReportPageWidgets/report_navbar.dart';
import 'package:frontend/ReportPageWidgets/report_trends.dart';

class ReportPage extends StatelessWidget {
  final String apiUrl;
  const ReportPage({super.key, required this.apiUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ReportDetails(apiUrl: apiUrl),
          ReportTrends(apiUrl: apiUrl),
          ReportNavBar(apiUrl: apiUrl),
        ],
      ),
    );
  }
}
