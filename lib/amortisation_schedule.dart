import 'package:flutter/material.dart';
import 'amortisation_form.dart';
import 'calculate_interest_rate.dart';

class AmortisationSchedule extends StatelessWidget {
  final client;
  final financier;
  final asset;
  final date;
  final loan;
  final payment;
  final term;
  final lumpSum;

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
                  child: Text('Interest per period: ${calculateInterest()}'),
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
                Container(
                  child: createSchedule(date, payment, loan),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget createSchedule(date, payment, loan) {
  return DataTable(
    columns: const <DataColumn>[
      DataColumn(
        label: Text('Date'),
      ),
      DataColumn(
        label: Text('Payment'),
      ),
      DataColumn(
        label: Text('Interest'),
      ),
      DataColumn(
        label: Text('Principal'),
      ),
      DataColumn(
        label: Text('Balance'),
      ),
    ],
    rows: <DataRow>[
      DataRow(
        cells: <DataCell>[
          const DataCell(Text('Opening Balance')),
          const DataCell(Text('')), //only value if there is upfront payment
          const DataCell(Text('')),
          const DataCell(Text('')),
          DataCell(Text('$loan'))
        ],
      ),
    ],
  );
   
}
