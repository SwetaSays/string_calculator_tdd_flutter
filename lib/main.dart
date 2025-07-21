import 'package:flutter/material.dart';
import 'string_calculator.dart';

void main() {
  runApp(const StringCalculatorApp());
}

class StringCalculatorApp extends StatelessWidget {
  const StringCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'String Calculator',
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  final calculator = StringCalculator();

  void _calculate() {
    try {
      final sum = calculator.add(_controller.text);
      setState(() => _result = 'Result: $sum');
    } catch (e) {
      setState(() => _result = 'Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('String Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'Enter input'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: _calculate, child: const Text('Calculate')),
          const SizedBox(height: 16),
          Text(_result),
        ]),
      ),
    );
  }
}
