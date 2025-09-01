import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HourlyWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const HourlyWidget({super.key, required this.data});

  String getWeatherImage(double temp) {
    if (data['raining'] == true) return "assets/images/Rain.png";
    if (data['cloudy'] == true) return "assets/images/Clouds_Sun_Rain.png";
    if (data['sunny'] == true || temp >= 30) return "assets/images/Sun.png";
    return "assets/images/Clouds_Sun.png";
  }

  Widget buildHourCard(String hour, double temp) {
    final image = getWeatherImage(temp);

    return Container(
      width: 80, 
      height: 100, 
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.grey[850], 
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            hour,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Image.asset(image, width: 32, height: 32, fit: BoxFit.contain),
          const SizedBox(height: 6),
          Text(
            "${temp.toStringAsFixed(1)}°C",
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hourly = data['hourly'] as Map<String, dynamic>;
    final hours = hourly.keys.toList();

    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hours.length,
        itemBuilder: (context, index) {
          final hour = hours[index];
          final temp = (hourly[hour] as num).toDouble();
          return buildHourCard(hour, temp);
        },
      ),
    );
  }
}
