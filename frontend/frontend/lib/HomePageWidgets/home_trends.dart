import 'package:flutter/material.dart';
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
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Trends",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ToggleButtons(
                isSelected: [showHourly, !showHourly],
                onPressed: (index) {
                  setState(() {
                    showHourly = index == 0;
                  });
                },
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("Hours"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("Weeks"),
                  ),
                ],
              )
            ],
          ),
          const Divider(height: 24, thickness: 1),

          Container(
            height: 120,
            color: Colors.white,
            child: Center(
              child: showHourly ? HourlyWidget(data: widget.data) : WeeklyWidget(data: widget.data),
            ),
          )
        ],
      ),
    );
  }
}
