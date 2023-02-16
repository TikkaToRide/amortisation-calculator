import 'package:flutter/material.dart';

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _AmortisationForm();
}

class _AmortisationForm extends State<MainForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Client Name',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Finance Company',
                    hintText: 'Toyota Finance', //don't know if i should keep
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Asset Purchased',
                    hintText: 'Toyota Camry (S123ABC)',
                  ),
                ),
              ),
              //Need to insert date picker
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Loan Amount',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Payment Amount',
                  ),
                ),
              ),
              //Add to row with below
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number of Payments',
                  ),
                ),
              ),
              //Need to Add DropDown Menu (Yearly, Quarterly, Monthly, Weekly)
              //Add to row with above
              //Add to row with below
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Lump Sum Payment',
                  ),
                ),
              ),
              //Need to Add DropDown Menu (None, Upfront, Balloon)
              //Add to row with above

              //Add to row with below
              /*Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextButton(
                  onPressed: () {},//Need to do something...
                  child: Text ('Calculate'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextButton(
                  onPressed: () {},//Need to do something
                  child: Text ('Clear'),
                ),
              ),*/
              //Add to row with above
            ],
          ),
        ),
      ),
    );
  }
}
