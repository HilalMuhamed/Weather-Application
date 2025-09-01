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
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trends",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(height: 24, thickness: 1),
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
                    MaterialPageRoute(builder: (_) => const BarChartPage()),
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
                    MaterialPageRoute(builder: (_) => const PieChartPage()),
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
                    MaterialPageRoute(builder: (_) => const LineChartPage()),
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
                    MaterialPageRoute(builder: (_) => const RadarChartPage()),
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
    {required IconData icon, required String label, required VoidCallback onTap}) {
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                )
              ],
            ),
            child: Icon(icon, size: 32, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
}
