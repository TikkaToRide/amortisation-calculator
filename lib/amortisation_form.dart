import 'package:flutter/material.dart';
import 'amortisation_schedule.dart';
import 'calculate_interest_rate.dart';
import 'package:intl/intl.dart';

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _AmortisationForm();
}

final clientName = TextEditingController();
final financeCompany = TextEditingController();
final assetPurchased = TextEditingController();
TextEditingController dateOfFirstPayment = TextEditingController();
final loanAmount = TextEditingController();
final paymentAmount = TextEditingController();
final numberOfPayments = TextEditingController();
final lumpSumAmount = TextEditingController();

var paymentsPerYear;
var lumpSumType;

class _AmortisationForm extends State<MainForm> {
  @override
  void dispose() {
    clientName.dispose();
    financeCompany.dispose();
    assetPurchased.dispose();
    dateOfFirstPayment.dispose();
    loanAmount.dispose();
    paymentAmount.dispose();
    numberOfPayments.dispose();
    lumpSumAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: clientName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Client Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: financeCompany,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Finance Company',
                    hintText: 'Toyota Finance',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: assetPurchased,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Asset Purchased',
                    hintText: 'Toyota Camry (S123ABC)',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: dateOfFirstPayment,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date Of First Payment',
                      suffixIcon: Icon(Icons.date_range)),
                  readOnly: true,
                  onTap: () => getDate(
                    context: context,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: loanAmount,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Loan Amount',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: paymentAmount,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Payment Amount',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: TextField(
                        controller: numberOfPayments,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Number of Payments',
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      //This border is slightly to big
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            isDense: true,
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text('Yearly'),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text('Quarterly'),
                              ),
                              DropdownMenuItem(
                                value: 12,
                                child: Text('Monthly'),
                              ),
                              DropdownMenuItem(
                                value: 52,
                                child: Text('Weekly'),
                              ),
                            ],
                            value: paymentsPerYear,
                            hint: const Text('Payments Per Year'),
                            onChanged: (value) {
                              setState(
                                () {
                                  paymentsPerYear = value;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: TextField(
                        controller: lumpSumAmount,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Lump Sum Payment',
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      //This border is slightly to big
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            isDense: true,
                            items: const [
                              DropdownMenuItem(
                                value: 101,
                                child: Text('Upfront'),
                              ),
                              DropdownMenuItem(
                                value: 102,
                                child: Text('Balloon'),
                              ),
                            ],
                            value: lumpSumType,
                            hint: const Text('None'),
                            onChanged: (value) {
                              setState(
                                () {
                                  lumpSumType = value;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        if (/*dateOfFirstPayment.text == ''||*/
                            loanAmount.text == '' ||
                                paymentAmount.text == '' ||
                                numberOfPayments.text == '' ||
                                paymentsPerYear == null) {
                          //Need to fix tip trigger
                          helpMessage(context);
                        } else {
                          transferDataToSchedule(context);
                        }
                      },
                      child: const Text('Calculate'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        resetForm();
                        setState(() {
                          paymentsPerYear = null;
                          lumpSumType = null;
                        });
                      },
                      child: const Text('Reset'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

getDate({required BuildContext context}) async {
  DateTime? dateSelected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime.now(),
  );
  if (dateSelected != null) {
    return dateOfFirstPayment.text =
        DateFormat('dd MMMM yyyy').format(dateSelected);
  }
}

helpMessage(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Tip'),
      content: const Text('Make sure all fields are completed'),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.pop(context, 'Close'),
            child: const Text('Close'))
      ],
    ),
  );
}

void resetForm() {
  clientName.clear();
  financeCompany.clear();
  assetPurchased.clear();
  dateOfFirstPayment.clear(); //***First need to add date input box***
  loanAmount.clear();
  paymentAmount.clear();
  numberOfPayments.clear();
  lumpSumAmount.clear();
}

void transferDataToSchedule(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AmortisationSchedule(
        client: clientName,
        financier: financeCompany,
        asset: assetPurchased,
        loan: loanAmount.text,
        payment: paymentAmount.text,
        term: numberOfPayments.text,
        lumpSum: lumpSumAmount.text,
        interestRate: calculateInterest(),
      ),
    ),
  );
}
