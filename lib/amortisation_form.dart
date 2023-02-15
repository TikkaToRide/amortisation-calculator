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
      child: Container(
        //unsure if necessary as it contains the column but
        alignment: Alignment
            .center, //this does not center the column when in full screen
        constraints: const BoxConstraints(
            maxWidth: 500), //however this does cap the width
        padding: const EdgeInsets.symmetric(
            vertical: 16), //and this does add padding to the container
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
          ],
        ),
      ),
    );
  }
}
