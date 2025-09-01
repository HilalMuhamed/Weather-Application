import 'package:flutter/material.dart';
import 'package:frontend/ChartPageWidgets/bar_chart.dart';
import 'package:frontend/ChartPageWidgets/pie_chart.dart';
import 'package:frontend/ChartPageWidgets/line_chart.dart';
import 'package:frontend/ChartPageWidgets/radar_chart.dart';

class ReportTrends extends StatelessWidget {
  final Map<String, dynamic> data;
  const ReportTrends({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0A0A0A), Color(0xFF201F1C)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Trends Heading ---
          const Text(
            "Trends",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
          const Divider(
            height: 24,
            thickness: 1,
            color: Colors.white,
          ),


          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date: ${data['date']}                                                            Day: ${data['day']}",
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: const Color.fromARGB(255, 255, 119, 34)
                ),
              ),
              Text(
                "Temp: ${data['temperature']}                                                                 Humidity: ${data['humidity']}",
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: const Color.fromARGB(255, 255, 119, 34),
                ),
              ),
              Text(
                "Wind: ${data['wind_speed']}                                                                Rain: ${data['raining'] ? "Yes" : "No"}",
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: const Color.fromARGB(255, 255, 119, 34),
                ),
              ),
              Text(
                "Cloudy: ${data['cloudy'] ? "Yes" : "No"}",
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: const Color.fromARGB(255, 255, 119, 34),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // --- Charts Heading ---
          const Text(
            "Charts",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
          const Divider(
            height: 24,
            thickness: 1,
            color: Colors.white,
          ),
          const SizedBox(height: 12),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _chartBox(
                context,
                icon: Icons.bar_chart,
                label: "Bar",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => BarChartPage(data: data)),
                  );
                },
              ),
              _chartBox(
                context,
                icon: Icons.pie_chart,
                label: "Pie",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PieChartPage(data: data)),
                  );
                },
              ),
              _chartBox(
                context,
                icon: Icons.show_chart,
                label: "Line",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LineChartPage(data: data)),
                  );
                },
              ),
              _chartBox(
                context,
                icon: Icons.radar,
                label: "Radar",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => RadarChartPage(data: data)),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chartBox(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  )
                ],
              ),
              child: Icon(
                icon,
                size: 32,
                color: const Color.fromARGB(255, 255, 119, 34), 
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
