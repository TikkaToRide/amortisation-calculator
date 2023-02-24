import 'dart:math';
import 'package:amortisation_calculator/amortisation_form.dart';

//Values do not reset when form is reset???
double principal = double.parse(loanAmount.text);
double payment = double.parse(paymentAmount.text);
int term = int.parse(numberOfPayments.text);

double f(x) =>
    principal * x * pow((1 + x), term) / (pow((1 + x), term) - 1) - payment;

double fPrime(x) =>
    principal *
    (pow((1 + x), term) / (-1 + pow((1 + x), term)) -
        term *
            x *
            pow((1 + x), (-1 + 2 * term)) /
            pow(-1 + pow((1 + x), term), 2) +
        term * x * pow((1 + x), (-1 + term)) / (-1 + pow((1 + x), term)));

double calculateInterest() {
  var tolerableError = 0.00001;
  var currentGuess = 0.05 / paymentsPerYear;
  for (var i = 0; i < 20; i++) {
    var oldGuess = currentGuess;
    currentGuess = oldGuess - f(oldGuess) / fPrime(oldGuess);
    var guessDifference = (currentGuess - oldGuess).abs();
    if (guessDifference < tolerableError) {
      break;
    }
  }

  return currentGuess;
}
