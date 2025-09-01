import 'package:flutter/material.dart';
import 'package:frontend/ReportPageWidgets/report_details.dart';
import 'package:frontend/ReportPageWidgets/report_navbar.dart';
import 'package:frontend/ReportPageWidgets/report_trends.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ReportDetails(),
          ReportTrends(),
          ReportNavBar(),
        ],
      ),
    );
  }
}
