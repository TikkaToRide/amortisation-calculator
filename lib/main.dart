import 'package:flutter/material.dart';
import 'amortisation_form.dart';

void main() {
  runApp(const AmortisationCalculator());
}

class AmortisationCalculator extends StatelessWidget {
  const AmortisationCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: MainForm()),
    );
  }
}
