import 'package:flutter/material.dart';

class AmortisationSchedule extends StatelessWidget {
  const AmortisationSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Back'),
      ),
    );
  }
}
