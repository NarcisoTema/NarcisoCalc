import 'package:flutter/material.dart';
import 'calculator.dart';  // Importando o arquivo calculator.dart
import 'theme.dart';       // Importando o arquivo theme.dart

void main() {
  runApp(NarcisoCalc());
}

class NarcisoCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NarcisoCalc',
      theme: AppTheme.lightTheme,  // Aplicando o tema definido no theme.dart
      home: CalculatorScreen(),   // Tela inicial que exibe a calculadora
    );
  }
}


