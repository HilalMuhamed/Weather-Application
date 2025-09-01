import 'package:flutter/material.dart';
import 'package:frontend/ChartPageWidgets/chart_app_bar.dart';
import 'package:frontend/ChartPageWidgets/chart_chart.dart';
import 'package:frontend/ChartPageWidgets/chart_details.dart';

class ChartPage extends StatelessWidget {
  final String apiUrl;
  const ChartPage({super.key, required this.apiUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ChartAppBar(),
          ChartChart(apiUrl: apiUrl),
          ChartDetails(apiUrl: apiUrl),
        ],
      ),
    );
  }
}
