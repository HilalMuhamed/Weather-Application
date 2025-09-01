import 'package:flutter/material.dart';

class ReportDetails extends StatelessWidget {
  final Map<String, dynamic> data;
  const ReportDetails({super.key, required this.data});


  String getWeatherImage() {
    if (data['raining'] == true) {
      return "assets/images/Rain.png";
    } else if (data['cloudy'] == true) {
      return "assets/images/Clouds_Sun_Rain.png";
    } else if (data['sunny'] == true || data['temperature'] != null) {
      return "assets/images/Sun.png";
    } else {
      return "assets/images/Clouds_Sun.png"; 
    }
  }

  @override
  Widget build(BuildContext context) {
    final date = data['date'] ?? "2025-09-01";
    final day = data['day'] ?? "Monday";
    final temp = data['temperature'] ?? "31.7 °C";
    final humidity = data['humidity'] ?? "65%";
    final wind = data['wind_speed'] ?? "12 km/h";
    final raining = data['raining'] == true ? "Yes" : "No";
    final cloudy = data['cloudy'] == true ? "Yes" : "No";

    final weatherImage = getWeatherImage();

    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.9;

    return Center(
      child: Container(
        width: containerWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0A0A0A), Color(0xFF201F1C)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              date,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),

            Text(
              day,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

 
            Column(
              children: [
                Image.asset(weatherImage, width: 120, height: 120),
                const SizedBox(height: 8),
                Text(
                  temp,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),


            
          ],
        ),
      ),
    );
  }
}
