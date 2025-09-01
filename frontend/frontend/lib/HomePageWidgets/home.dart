import 'package:flutter/material.dart';
import 'package:frontend/HomePageWidgets/home_app_bar.dart';
import 'package:frontend/HomePageWidgets/home_nav_bar.dart';
import 'package:frontend/HomePageWidgets/home_summary.dart';
import 'package:frontend/HomePageWidgets/home_trends.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
        HomeAppBar(),
        HomeSummary(),
        HomeTrends(),
        HomeNavBar(),
        ],
      ),
    );
  }
}
