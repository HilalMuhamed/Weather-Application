import 'package:flutter/material.dart';
import 'package:frontend/AboutPageWidgets/about.dart';
import 'package:frontend/HomePageWidgets/home.dart';
import 'package:frontend/ReportPageWidgets/report.dart';

class HomeNavBar extends StatelessWidget {
  final Map<String, dynamic> data;
  const HomeNavBar({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
  margin: const EdgeInsets.all(16), 
  decoration: BoxDecoration(
    color: const Color(0xFF0A0A0A), 
    borderRadius: BorderRadius.circular(20), 
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3), 
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  child: BottomNavigationBar(
    backgroundColor: Colors.transparent,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrangeAccent,
    unselectedItemColor: Colors.white,
    selectedLabelStyle: const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: const TextStyle(
      fontFamily: 'Poppins',
    ),
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.description), label: "Report"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "About Me"),
    ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReportPage(data: data)),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutPage()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHome()),
            );
          }
        },
      ),
    );
  }
}
