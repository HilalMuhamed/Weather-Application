import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:frontend/HomePageWidgets/home_app_bar.dart';
import 'package:frontend/HomePageWidgets/home_nav_bar.dart';
import 'package:frontend/HomePageWidgets/home_summary.dart';
import 'package:frontend/HomePageWidgets/home_trends.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final String apiUrl = "http://localhost:8000/weather";
  Map<String, dynamic>? weatherData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          weatherData = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      debugPrint("Error fetching weather: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (weatherData == null) {
      return const Scaffold(
        body: Center(child: Text("Failed to load weather data")),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          const HomeAppBar(),
          HomeSummary(data: weatherData!),
          HomeTrends(data: weatherData!),
          HomeNavBar(data: weatherData!),
        ],
      ),
    );
  }
}
