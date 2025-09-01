import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/HomePageWidgets/hourly_widget.dart';
import 'package:frontend/HomePageWidgets/weekly_widget.dart';

class HomeTrends extends StatefulWidget {
  final Map<String, dynamic> data;
  const HomeTrends({super.key, required this.data});

  @override
  State<HomeTrends> createState() => _HomeTrendsState();
}

class _HomeTrendsState extends State<HomeTrends> {
  bool showHourly = true;

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
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trends",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              ToggleButtons(
                isSelected: [showHourly, !showHourly],
                onPressed: (index) {
                  setState(() {
                    showHourly = index == 0;
                  });
                },
                borderRadius: BorderRadius.circular(12),
                fillColor: Colors.orange.shade700,
                selectedColor: Colors.white,
                color: Colors.orange.shade300,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text("Hours",
                        style: GoogleFonts.poppins(fontSize: 14)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text("Weeks",
                        style: GoogleFonts.poppins(fontSize: 14)),
                  ),
                ],
              )
            ],
          ),
          const Divider(height: 24, thickness: 1, color: Colors.white24),

          Container(
            height: showHourly ? 200 : 260,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: showHourly
                  ? HourlyWidget(data: widget.data)
                  : WeeklyWidget(data: widget.data),
            ),
          ),
        ],
      ),
    );
  }
}
