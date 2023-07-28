import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ElevatorPanel(),
  ));
}
class ElevatorPanel extends StatelessWidget {
  // 按鈕的文字列表
  final List<String> buttonLabels = [
    '1', '2', '3', '4', '5',
    '6', '7', '8', '9', '10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elevator Panel'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 每行兩個按鈕
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            itemCount: buttonLabels.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  // 在這裡處理按下按鈕的邏輯
                  print('按下按鈕: ${buttonLabels[index]}');
                },
                child: Text(buttonLabels[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

