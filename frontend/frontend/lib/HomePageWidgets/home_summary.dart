import 'package:flutter/material.dart';
import 'package:frontend/ReportPageWidgets/report.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSummary extends StatelessWidget {
  final Map<String, dynamic> data;
  const HomeSummary({super.key, required this.data});

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

  String formatDate(String date) {
    try {
      DateTime dt = DateTime.parse(date);
      return DateFormat("dd MMM yyyy").format(dt);
    } catch (_) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    final weatherImage = getWeatherImage();
    String temp = data['temperature']?.toString().replaceAll("C", "") ?? "";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 14.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0A0A0A), Color(0xFF201F1C)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day & Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  data['day'] ?? '',
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                formatDate(data['date'] ?? ''),
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                weatherImage,
                width: 120,
                height: 120,
              ),
              Text(
                temp,
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF222222),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                  textStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportPage(data: data),
                    ),
                  );
                },
                child: const Text("Details"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Humidity: ${data['humidity'] ?? ''}",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Wind: ${data['wind_speed'] ?? ''}",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Raining: ${data['raining'] == true ? 'Yes' : 'No'}",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
