// ReportPage.dart
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
      backgroundColor: Colors.black, 
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReportDetails(data: data),
            const SizedBox(height: 10),
            ReportTrends(data: data),
            const SizedBox(height: 10),
            ReportNavBar(data: data),
          ],
        ),
      ),
    );
  }
}
