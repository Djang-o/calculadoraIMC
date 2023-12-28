import 'package:imc/classes/pessoa.dart';
import 'dart:io';

void main(List<String> arguments) {
  Pessoa? p1;
  while (p1 == null) {
    try {
      print('Digite o Nome:');
      String nome = stdin.readLineSync()!;

      print('Digite o peso:');
      double peso = double.parse(stdin.readLineSync()!);

      print('Digite a altura:');
      double altura = double.parse(stdin.readLineSync()!);
      p1 = Pessoa(nome, peso, altura);

      p1.setIMC(peso / (altura * altura));
    } catch (e) {
      print('Erro na entrada dos dados: $e');
    }
  }
  print(p1.toString());
}
