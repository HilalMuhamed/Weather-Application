import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Colors.black, 
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    if (weatherData == null) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            "Failed to load weather data",
            style: GoogleFonts.poppins( 
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black, 
      body: SafeArea(
        child: DefaultTextStyle( 
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.white, 
          ),
          child: Column(
            children: [
              const HomeAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeSummary(data: weatherData!),
                      const SizedBox(height: 10),
                      HomeTrends(data: weatherData!),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeNavBar(data: weatherData!),
    );
  }
}
