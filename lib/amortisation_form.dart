import 'package:flutter/material.dart';
import 'amortisation_schedule.dart';

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _AmortisationForm();
}

final clientName = TextEditingController();
final financeCompany = TextEditingController();
final assetPurchased = TextEditingController();
final dateOfFirstPayment = TextEditingController();
final loanAmount = TextEditingController();
final paymentAmount = TextEditingController();
final numberOfPayments = TextEditingController();
final lumpSumAmount = TextEditingController();

var paymentsPerYear;
var lumpSumType;

class _AmortisationForm extends State<MainForm> {
//Will need below later
  @override
  void initState() {
    super.initState();
    /*clientName.addListener(tranferToSchedule);
    financeCompany.addListener(tranferToSchedule);
    assetPurchased.addListener(tranferToSchedule);
    dateOfFirstPayment.addListener(tranferToSchedule);
    loanAmount.addListener(tranferToSchedule);
    paymentAmount.addListener(tranferToSchedule);
    numberOfPayments.addListener(tranferToSchedule);
    lumpSumAmount.addListener(tranferToSchedule);*/
  }

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
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
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
                    hintText: 'Toyota Finance', //don't know if i should keep
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
              //Need to insert date picker
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: loanAmount,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AmortisationSchedule(),
                            ),
                          );
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
  //dateOfFirstPayment.clear(); ***First need to add date input box***
  loanAmount.clear();
  paymentAmount.clear();
  numberOfPayments.clear();
  lumpSumAmount.clear();
}
