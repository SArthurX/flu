import 'package:flutter/material.dart';

void main() {
  runApp(ElevatorPanelApp());
}

class ElevatorPanelApp extends StatelessWidget {
  const ElevatorPanelApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ElevatorPanel(),
    );
  }
}

class ElevatorPanel extends StatelessWidget {
  final List<int> buttonNumbers = List.generate(10, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elevator Panel'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0, // 控制格子的寬高比例，這裡設置為1.0表示寬高相等
        children: buttonNumbers.map((number) {
          return ElevatorButton(number: number);
        }).toList(),
      ),
    );
  }
}

class ElevatorButton extends StatelessWidget {
  final int number;

  ElevatorButton({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Add your button press logic here
          print('Button $number pressed.');
        },
        child: Text(
          '$number',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}