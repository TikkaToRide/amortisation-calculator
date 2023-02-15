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
            ],
          ),
        ),
      ),
    );
  }
}
