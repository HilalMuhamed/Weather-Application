import 'package:flutter/material.dart';
import 'package:frontend/AboutPageWidgets/about.dart';

import 'package:frontend/HomePageWidgets/home.dart';
import 'package:frontend/ReportPageWidgets/report.dart';

class HomeNavBar extends StatelessWidget {
  final Map<String, dynamic> data;
  const HomeNavBar({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.description), label: "Report"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "About Me"),
      ],
      onTap: (index) {
        if (index == 1) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ReportPage(data: data)));
        } else if (index == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHome()));
        }
      },
    );
  }
}