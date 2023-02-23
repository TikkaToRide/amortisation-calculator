import 'package:flutter/material.dart';

class AmortisationSchedule extends StatelessWidget {
  final client;
  final financier;
  final asset;

  const AmortisationSchedule({
    super.key,
    required this.client,
    required this.financier,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 735, maxHeight: 1030),
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      client.text + ' - ' + financier.text + ' - ' + asset.text,
                      textScaleFactor: 1.5,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Loan Amount: '),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Payment Amount: '),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Interest Rate: '),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Number of Payments: '),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Lump Sum Amount: '),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Payments Frequency: '),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Lump Sum Type: '),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
