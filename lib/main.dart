import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ElevatorPanel(),
  ));
}
class ElevatorPanel extends StatefulWidget {
  @override
  _ElevatorPanelState createState() => _ElevatorPanelState();
}



class _ElevatorPanelState extends State<ElevatorPanel> {
  // 按鈕的文字列表
  final List<String> buttonLabels = [
    '9', '10', '7', '8', '5',
    '6', '3', '4', '1', '2',
  ];

  // 儲存按鈕是否被按下的狀態
  Map<String, bool> buttonStatus = {};

  @override
  void initState() {
    super.initState();
    // 初始化按鈕狀態為false（未按下）
    for (var label in buttonLabels) {
      buttonStatus[label] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('非接觸防疫電梯系統(Alpha)'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 1.5, // 調整按鈕的寬高比例
            ),
            itemCount: buttonLabels.length,
            shrinkWrap: true, // 使得 GridView 不佔用多餘空間
            physics: NeverScrollableScrollPhysics(), // 禁止 GridView 滾動
            itemBuilder: (context, index) {
              String label = buttonLabels[index];
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    // 將按鈕狀態設置為true（按下）
                    buttonStatus[label] = !buttonStatus[label]!;
                    print(label);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: buttonStatus[label] !? Colors.red : null, // 設置按鈕的顏色
                ),
                child: Text(label),
              );
            },
          ),
        ),
      ),

      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Page('手勢字典',page1),
          _Page('電梯面板',page1),
          _Page('定義手勢',page1),
        ],
      ),
    );
  }

  Widget _Page(String text, void Function() wherepage) {
    return TextButton(
      onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BPage()));
        },

      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
  void page1() {
    print('轉跳');
  }
  
  
}

class BPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('頁面'),
      ),
      body: _BPage(),
    );
  }
}

class _BPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text('返回首頁'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
