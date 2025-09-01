import 'package:flutter/material.dart';


class WeeklyWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const WeeklyWidget({super.key, required this.data});

  String getWeatherImage(String day) {
    final tempStr = data['weekly'][day] ?? '';
    final temp = double.tryParse(tempStr.replaceAll('°C', '').trim()) ?? 0;

    if (data['raining'] == true) return "assets/images/Rain.png";
    if (data['cloudy'] == true) return "assets/images/Clouds_Sun_Rain.png";
    if (data['sunny'] == true || temp >= 30) return "assets/images/Sun.png";
    return "assets/images/Clouds_Sun.png";
  }

  Widget buildDayCard(String day) {
    final temp = data['weekly'][day] ?? '';
    final image = getWeatherImage(day);

    return Container(
      width: 75, 
      padding: const EdgeInsets.all(8), 
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[900], 
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11, 
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Image.asset(image, width: 40, height: 40), 
          const SizedBox(height: 4),
          Text(
            temp,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11, 
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weekly = data['weekly'] as Map<String, dynamic>;
    final days = weekly.keys.toList();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0A0A0A), Color(0xFF201F1C)], 
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: days.take(4).map((day) => buildDayCard(day)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: days.skip(4).map((day) => buildDayCard(day)).toList(),
          ),
        ],
      ),
    );
  }
}
