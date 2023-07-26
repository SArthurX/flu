import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "非接觸防疫電梯系統",
          style: TextStyle(
            fontSize: 40,
            //fontWeight: FontWeight.bold, 粗體
            letterSpacing: 2, //字體寬度
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 55, 228, 162),
      ),
      body: 
        Center(
        child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text('Deliver features faster'),
              Text('Craft beautiful UIs'),
              Expanded( //自動填滿
                child: FittedBox(
                  fit: BoxFit.contain, 
                  child: const FlutterLogo(),
                ),
              ),
              //圖片

              const Text(
                '功德',
              ),

              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const ElevatedButton  (
                onPressed: null,
                child: Text(
                  'Disabled Button',
                  style: TextStyle(fontSize: 20)
                ),
              ),
              const SizedBox(height: 100),//空格
              Row( //同個body不能同時選用column和row必須把row放在column裡面
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.circle, color: Colors.blue),
                Icon(Icons.circle, color: Colors.blue),
                Icon(Icons.circle, color: Colors.blue),
              ],
            ),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        elevation: 20, //陰影
      ), 
    );
    
  }
}
