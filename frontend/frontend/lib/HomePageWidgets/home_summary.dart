import 'package:flutter/material.dart';
import 'package:frontend/ReportPageWidgets/report.dart';

class HomeSummary extends StatelessWidget {
  final Map<String, dynamic> data;
  const HomeSummary({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                "Sunday",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "2025-08-31",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/Sun.png",
                width: 60,
                height: 60,
              ),
              const Text(
                "32.5 °C",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Humidity: 67 %"),
                  SizedBox(height: 4),
                    Text("Wind: 14 km/h"),
                  SizedBox(height: 4),
                  Text("Raining: Yes"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
