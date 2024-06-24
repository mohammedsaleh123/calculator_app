import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorCubit extends Cubit<String> {
  CalculatorCubit() : super("0.0");
  String input = "";
  String output = "";
  List<String> inputList = [
    "C",
    "Del",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "⌫",
    "="
  ];

  void calculate(String text) {
    Parser p = Parser();
    if (text == 'x') {
      text = '*';
    }
    if (input.endsWith('.') && text == '.' ||
        input.endsWith('*') && text == '*' ||
        input.endsWith('-') && text == '-' ||
        input.endsWith('+') && text == '+' ||
        input.endsWith('/') && text == '/' ||
        input.endsWith('%') && text == '%') {
      text = '';
    }
    if (input == '' && text == '.' ||
        input == '' && text == '*' ||
        input == '' && text == '-' ||
        input == '' && text == '+' ||
        input == '' && text == '/' ||
        input == '' && text == '%') {
      text = '';
    }
    if (text != '=' && text != 'Del') {
      input += text;
      emit(input);
    }
    if (text == "C") {
      input = "";
      output = "";
      emit("0.0");
    } else if (text == "Del") {
      input = input.substring(0, input.length - 1);
      emit(input);
    } else if (text == "⌫") {
      input = input.substring(0, input.length - 1);
      emit((input.length - 1).toString());
    } else if (text == "=") {
      Expression exp = p.parse(input);
      double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
      output = eval.toString();
      input = '';
      emit(output);
    }
  }
}
