import 'package:flutter/material.dart';

void main() {
  runApp(NarcisoCalc());
}

class NarcisoCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NarcisoCalc',
      theme: ThemeData(
        primaryColor: Color(0xFF005C99), // Azul normal
        accentColor: Color(0xFF3399FF), // Azul carregada
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _input = "";

  // Função para atualizar a entrada
  void _onButtonPressed(String value) {
    setState(() {
      if (_output == "0") {
        _output = value;
      } else {
        _output += value;
      }
    });
  }

  // Função para calcular o resultado
  void _calculateResult() {
    try {
      // Usando a função eval para calcular a expressão
      final result = _evaluateExpression(_output);
      setState(() {
        _output = result.toString();
      });
    } catch (e) {
      setState(() {
        _output = "Error";
      });
    }
  }

  // Função para avaliar a expressão matemática
  double _evaluateExpression(String expression) {
    // Aqui você pode integrar algum método para avaliar expressões matemáticas
    // Esse é apenas um exemplo simples
    return double.parse(expression);
  }

  // Função para apagar
  void _clear() {
    setState(() {
      _output = "0";
    });
  }

  // Função para construir os botões
  Widget _buildButton(String label, {Color color = Colors.blue}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(20),
          ),
          onPressed: () {
            if (label == "=") {
              _calculateResult();
            } else if (label == "C") {
              _clear();
            } else {
              _onButtonPressed(label);
            }
          },
          child: Text(
            label,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NarcisoCalc")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  _output,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton("7"),
              _buildButton("8"),
              _buildButton("9"),
              _buildButton("/", color: Color(0xFF3399FF)), // Azul carregada
            ],
          ),
          Row(
            children: [
              _buildButton("4"),
              _buildButton("5"),
              _buildButton("6"),
              _buildButton("x", color: Color(0xFF3399FF)),
            ],
          ),
          Row(
            children: [
              _buildButton("1"),
              _buildButton("2"),
              _buildButton("3"),
              _buildButton("-", color: Color(0xFF3399FF)),
            ],
          ),
          Row(
            children: [
              _buildButton("0"),
              _buildButton("."),
              _buildButton("=", color: Color(0xFF3399FF)),
              _buildButton("+", color: Color(0xFF3399FF)),
            ],
          ),
          Row(
            children: [
              _buildButton("C", color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}
