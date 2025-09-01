import 'package:flutter/material.dart';

class ReportDetails extends StatelessWidget {
  final Map<String, dynamic> data;
  const ReportDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Extract data from map or use placeholder
    final date = data['date'] ?? "2025-09-01";
    final day = data['day'] ?? "Monday";
    final temp = data['temperature'] ?? "31.7 °C";
    final imagePath = "assets/images/Sun.png"; // placeholder

    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            date,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            day,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Image.asset(
            imagePath,
            width: 80,
            height: 80,
          ),
          const SizedBox(height: 12),
          Text(
            temp,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

