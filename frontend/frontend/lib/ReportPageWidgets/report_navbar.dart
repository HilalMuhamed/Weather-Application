import 'package:flutter/material.dart';
import 'package:frontend/AboutPageWidgets/about.dart';
import 'package:frontend/HomePageWidgets/home.dart';

class ReportNavBar extends StatelessWidget {
  final Map<String, dynamic> data;
  const ReportNavBar({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1, 
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.description), label: "Report"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "About Me"),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyHome()),
          );
        } else if (index == 1) {

        } else if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AboutPage()),
          );
        }
      },
    );
  }
}
