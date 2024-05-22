import 'package:math_expressions/math_expressions.dart';

class Calculadora {

  double operacoes(String expression) {
  
    // Dividir a string em uma lista de substrings usando o sinal como delimitador
    List<String> parts = expression.split(RegExp(r'(\+|\-|\*|\/)'));


    double number1 = double.parse(parts[0]);
    double number2 = double.parse(parts[1]);
    String operator = expression.replaceAll(RegExp(r'[0-9]'), '');
  
    double result = 0;

    if (operator == '+') {
      result = adicao(number1, number2);
    }
    else if (operator == '-') {
      result = subtracao(number1, number2);
    }
    else if (operator == '*') {
      result = multiplicacao(number1, number2);
    }
    else if (operator == '/') {
      result = divisao(number1, number2);
    }

  return result;
  
  }

  double adicao(double a, double b) {
    return a + b;
  }

  double subtracao(double a, double b) {
    return (a - b);
  }

  double multiplicacao(double a, double b) {
    return a * b;
  }

  double divisao(double a, double b) {
    if (b != 0) {
      return a / b;
    } else {
      throw Exception('Erro: Divisão por zero');
    }
  }

  String derivada(String expr) {
    // Parse da expressão
    Parser p = Parser();
    Expression exp = p.parse(expr);

    // Derivada
    Expression derivada = exp.derive('x');
    derivada = derivada.simplify();

    return derivada.toString();
  }
}

