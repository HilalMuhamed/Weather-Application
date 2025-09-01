
import 'package:flutter/material.dart';

class ChartAppBar extends StatelessWidget {
  const ChartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text("Chart Header"),
    );
  }
}