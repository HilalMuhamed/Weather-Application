import 'package:flutter/material.dart';
import 'package:frontend/HomePageWidgets/home_app_bar.dart';
import 'package:frontend/HomePageWidgets/home_nav_bar.dart';
import 'package:frontend/HomePageWidgets/home_summary.dart';
import 'package:frontend/HomePageWidgets/home_trends.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});
  final String apiUrl = "http://localhost:8000/weather";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        const HomeAppBar(),
        HomeSummary(apiUrl: apiUrl),
        HomeTrends(apiUrl: apiUrl),
        HomeNavBar(apiUrl: apiUrl),
        ],
      ),
    );
  }
}
