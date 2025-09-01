import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class RadarChartPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const RadarChartPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    final Map<String, double> weeklyTemps = {};
    if (data['weekly'] != null) {
      data['weekly'].forEach((day, tempString) {
        weeklyTemps[day] =
            double.tryParse(tempString.replaceAll(" °C", "")) ?? 0.0;
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Radar Chart",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0A0A0A), Color(0xFF1E1D1A)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "Weekly Temperature Radar",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

 
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0A0A0A), Color(0xFF1E1D1A)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: 300,
                child: RadarChart(
                  RadarChartData(
                    radarShape: RadarShape.polygon,
                    radarBackgroundColor: Colors.orange.withOpacity(0.15),
                    dataSets: [
                      RadarDataSet(
                        fillColor: Colors.orange.withOpacity(0.4),
                        borderColor: Colors.deepOrange,
                        borderWidth: 2,
                        entryRadius: 4,
                        dataEntries: weeklyTemps.values
                            .map((value) => RadarEntry(value: value))
                            .toList(),
                      ),
                    ],
                    borderData: FlBorderData(show: false),
                    radarBorderData: BorderSide(color: Colors.deepOrange.shade300),
                    tickCount: 5,
                    titleTextStyle: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.orangeAccent,
                    ),
                    getTitle: (index, angle) {
                      return RadarChartTitle(
                        text: weeklyTemps.keys.elementAt(index),
                        angle: angle,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),


            Expanded(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0A0A0A), Color(0xFF1E1D1A)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView(
                  children: weeklyTemps.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        "${entry.key}: ${entry.value.toStringAsFixed(1)} °C",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
