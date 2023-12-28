class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;
  late double _imc;

  void setNome(nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  void setPeso(peso) {
    _peso = peso;
  }

  double getPeso() {
    return _peso;
  }

  void setIMC(imc) {
    _imc = imc;
  }

  double getIMC() {
    return _imc;
  }

  void setAltura(altura) {
    _altura = altura;
  }

  double getAltura() {
    return _altura;
  }

  List<String> calcularIMC() {
    if (_peso <= 0 || _altura <= 0) {
      throw ArgumentError('Peso e altura devem ser valores positivos');
    }

    double imcR = _peso / (_altura * _altura);

    List<Map<String, dynamic>> intervalos = [
      {
        'limiteInf': double.negativeInfinity,
        'limiteSup': 16,
        'mensagem': 'Magreza grave'
      },
      {'limiteInf': 16, 'limiteSup': 17, 'mensagem': 'Magreza moderada'},
      {'limiteInf': 17, 'limiteSup': 18.5, 'mensagem': 'Magreza leve'},
      {'limiteInf': 18.5, 'limiteSup': 25, 'mensagem': 'Saudável'},
      {'limiteInf': 25, 'limiteSup': 30, 'mensagem': 'Sobrepeso'},
      {'limiteInf': 30, 'limiteSup': 35, 'mensagem': 'Obesidade 1'},
      {'limiteInf': 35, 'limiteSup': 40, 'mensagem': 'Obesidade 2'},
      {
        'limiteInf': 40,
        'limiteSup': double.infinity,
        'mensagem': 'Obesidade 3'
      },
    ];

    for (var intervalo in intervalos) {
      if (imcR >= intervalo['limiteInf'] && imcR < intervalo['limiteSup']) {
        return [imcR.toStringAsFixed(2), intervalo['mensagem']];
      }
    }

    return ['Intervalo de IMC não reconhecido'];
  }

  Pessoa(String nome, double peso, double altura) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }
  @override
  String toString() {
    return {
      "Nome": _nome,
      "Peso": _peso,
      "Altura": _altura,
      "IMC": {
        calcularIMC(),
      }
    }.toString();
  }
}
