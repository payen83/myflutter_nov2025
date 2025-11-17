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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'My App'),
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
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  int total = 0;

  calculate(){
    setState(() {
      if(num1Controller.text.isNotEmpty && num1Controller.text.isNotEmpty){
        int num1 = int.parse(num1Controller.text);
        int num2 = int.parse(num2Controller.text);
        total = num1 + num2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Calculator App', 
              style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                  controller: num1Controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('First Number'),
                    hintText: 'Enter first nmumber'
                  ),
                  keyboardType: TextInputType.number
                ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                  controller: num2Controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Second Number'),
                    hintText: 'Enter second nmumber'
                  ),
                  keyboardType: TextInputType.number
                ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text('TOTAL: $total', style: TextStyle(fontSize: 20),),
            ),
            IconButton(onPressed: (){ calculate(); }, icon: Icon(Icons.add, color: Colors.red,))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
