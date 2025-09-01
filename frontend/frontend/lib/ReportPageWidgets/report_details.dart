
import 'package:flutter/material.dart';

class ReportDetails extends StatelessWidget {
  final String apiUrl;
  const ReportDetails({super.key, required this.apiUrl});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text("Report Initial Details "),
    );
  }
}
