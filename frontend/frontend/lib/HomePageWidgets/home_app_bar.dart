import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [

          Container(
            width: 40,
            height: 40,
            color: Colors.blueGrey,
            child: const Icon(Icons.wb_sunny, color: Colors.white),
          ),
          const SizedBox(width: 12),
          const Text(
            "Bright",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}