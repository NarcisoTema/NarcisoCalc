import 'package:flutter/material.dart';
import 'calculator.dart';
import 'theme.dart';

void main() {
  runApp(NarcisoCalc());
}

class NarcisoCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NarcisoCalc',
      theme: appTheme,
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String expression = "";

  void onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        expression = "";
      } else if (value == "=") {
        expression = evaluateExpression(expression);
      } else {
        expression += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerRight,
            child: Text(
              expression,
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                '7', '8', '9', '/',
                '4', '5', '6', '*',
                '1', '2', '3', '-',
                'C', '0', '=', '+'
              ].map((text) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appTheme.secondaryHeaderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => onButtonPressed(text),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

// calculator.dart
String evaluateExpression(String expression) {
  try {
    return expression.isEmpty ? "" : (double.parse(expression).toString());
  } catch (e) {
    return "Erro";
  }
}

// theme.dart
final ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFF003366), // Azul carregado
  secondaryHeaderColor: Color(0xFF3366FF), // Azul normal
);

