import 'package:flutter_test/flutter_test.dart';
import 'package:seminario_c214/calculadora.dart';

void main() {
  group('Testando a Calculadora', () {
    test('teste adição', () {
      final calculadora = Calculadora();
      expect(calculadora.adicao(2, 3), equals(5));
      expect(calculadora.adicao(-5, 3), equals(-2));
      expect(calculadora.adicao(0, 0), equals(0));
    });

    test('teste subtração', () {
      final calculadora = Calculadora();
      expect(calculadora.subtracao(5, 3), equals(2));
      expect(calculadora.subtracao(-5, 3), equals(-8));
      expect(calculadora.subtracao(0, 0), equals(0));
    });

    test('teste multiplicação', () {
      final calculadora = Calculadora();
      expect(calculadora.multiplicacao(2, 3), equals(6));
      expect(calculadora.multiplicacao(-2, 3), equals(-6));
      expect(calculadora.multiplicacao(0, 5), equals(0));
    });

    test('teste divisão', () {
      final calculadora = Calculadora();
      expect(calculadora.divisao(6, 3), equals(2));
      expect(calculadora.divisao(-6, 3), equals(-2));
      expect(calculadora.divisao(5, 2), equals(2.5));
    });

    test('teste divisão por 0', () {
      final calculadora = Calculadora();
      expect(
          () => calculadora.divisao(2, 0),
          throwsA(isA<Exception>().having((e) => e.toString(), 'message',
              contains('Erro: Divisão por zero'))));
    });

    test('teste derivada', () {
      final calculadora = Calculadora();
      expect(calculadora.derivada('x'), '1.0');
      expect(calculadora.derivada('2*x'), '2.0');
    });

    test('teste operacoes com adicao', () {
      final calculadora = Calculadora();
      expect(calculadora.operacoes('2+1'), 3.0);
    });

    test('teste operacoes com subtracao', () {
      final calculadora = Calculadora();
      expect(calculadora.operacoes('2-1'), 1.0);
    });

    test('teste operacoes com multiplicacao', () {
      final calculadora = Calculadora();
      expect(calculadora.operacoes('2*4'), 8.0);
    });

    test('teste operacoes com divisao', () {
      final calculadora = Calculadora();
      expect(calculadora.operacoes('4/2'), 2.0);
    });
  });
}
