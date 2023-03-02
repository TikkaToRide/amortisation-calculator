import 'dart:math';
import 'amortisation_form.dart';

/*
This code is based on 'Answer' found at below link.
https://stackoverflow.com/questions/3102476/calculating-annual-percentage-rate-need-some-help-with-inherited-code
*/

//Values do not reset when form is reset - need to fix
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
    var priorGuess = currentGuess;
    currentGuess = priorGuess - f(priorGuess) / fPrime(priorGuess);
    var guessDifference = (currentGuess - priorGuess).abs();
    if (guessDifference < tolerableError) {
      break;
    }
  }

  return currentGuess;
}
