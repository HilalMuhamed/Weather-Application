import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.9; 

    return Center(
      child: Container(
        width: containerWidth,
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0A0A0A), Color(0xFF201F1C)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/Sun_icon.png",
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
            const Text(
              "BRIGHT", 
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20, 
                fontWeight: FontWeight.w900, 
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
