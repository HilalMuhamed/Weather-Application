import 'package:flutter/material.dart';
import 'package:frontend/ReportPageWidgets/report_details.dart';
import 'package:frontend/ReportPageWidgets/report_navbar.dart';
import 'package:frontend/ReportPageWidgets/report_trends.dart';

class ReportPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const ReportPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ReportDetails(data: data),
          ReportTrends(data: data),
          ReportNavBar(data: data),
        ],
      ),
    );
  }
}
