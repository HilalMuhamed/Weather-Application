import 'package:flutter/material.dart';
import 'package:frontend/ChartPageWidgets/chart.dart';
import 'package:frontend/HomePageWidgets/home.dart';
import 'package:frontend/ReportPageWidgets/report.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.report), label: "Report"),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Chart"),
      ],
      onTap: (index) {
        if (index == 1) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportPage()));
        } else if (index == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ChartPage()));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHome()));
        }
      },
    );
  }
}