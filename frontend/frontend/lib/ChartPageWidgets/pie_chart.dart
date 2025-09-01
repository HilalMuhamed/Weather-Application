import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class PieChartPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const PieChartPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    final Map<String, double> weeklyTemps = {};
    if (data['weekly'] != null) {
      data['weekly'].forEach((day, tempString) {
        weeklyTemps[day] =
            double.tryParse(tempString.replaceAll(" °C", "")) ?? 0.0;
      });
    }

    
    final colors = [
      Colors.orange.shade300,
      Colors.orange.shade400,
      Colors.orange.shade500,
      Colors.deepOrange.shade400,
      Colors.deepOrange.shade500,
      Colors.orange.shade600,
      Colors.deepOrange.shade700,
    ];

    return Scaffold(
      backgroundColor: Colors.black, 
      appBar: AppBar(
        title: Text(
          "Pie Chart",
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
                  "Weekly Temperature Distribution",
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
                height: 250,
                child: PieChart(
                  PieChartData(
                    sections: weeklyTemps.entries.map((entry) {
                      int index = weeklyTemps.keys.toList().indexOf(entry.key);
                      return PieChartSectionData(
                        value: entry.value,
                        color: colors[index % colors.length],
                        title: entry.key.substring(0, 3), 
                        titleStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    }).toList(),
                    sectionsSpace: 2,
                    centerSpaceRadius: 40,
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
                    int index = weeklyTemps.keys.toList().indexOf(entry.key);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: colors[index % colors.length],
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "${entry.key}: ${entry.value.toStringAsFixed(1)} °C",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
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
