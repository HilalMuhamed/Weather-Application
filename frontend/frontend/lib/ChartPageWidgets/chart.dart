import 'package:flutter/material.dart';
import 'package:frontend/ChartPageWidgets/chart_app_bar.dart';
import 'package:frontend/ChartPageWidgets/chart_chart.dart';
import 'package:frontend/ChartPageWidgets/chart_details.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ChartAppBar(),
          ChartChart(),
          ChartDetails(),
        ],
      ),
    );
  }
}
