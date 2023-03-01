import 'package:amortisation_calculator/calculate_interest_rate.dart';
import 'package:flutter/material.dart';
import 'amortisation_form.dart';

class AmortisationSchedule extends StatelessWidget {
  final client;
  final financier;
  final asset;
  final date;
  final loan;
  final payment;
  final term;
  final lumpSum;
  final interestRate;

  const AmortisationSchedule({
    super.key,
    required this.client,
    required this.financier,
    required this.asset,
    required this.date,
    required this.loan,
    required this.payment,
    required this.term,
    required this.lumpSum,
    required this.interestRate,
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Loan Amount: $loan'),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Payment Amount: $payment'),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Date of First Payment: $date',
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      'Interest Rate: ${((calculateInterest() * paymentsPerYear) * 100).toStringAsFixed(2)}%'),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Interest per period: $interestRate'),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Number of Payments: $term'),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Lump Sum Amount: $lumpSum'),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Lump Sum Type: '),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back To Form'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
