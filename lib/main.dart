import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _firstController = TextEditingController(text: '');
  final _secondController = TextEditingController(text: '');
  int result = 0;
  Calculator calculator = Calculator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              key: const ValueKey('first'),
              controller: _firstController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              key: const ValueKey('second'),
              controller: _secondController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                key: const ValueKey('add'),
                onPressed: () {
                  setState(() {
                    result = calculator.add(int.parse(_firstController.text),
                        int.parse(_secondController.text));
                  });
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  setState(
                    () {
                      result = calculator.subtract(
                          int.parse(_firstController.text),
                          int.parse(_secondController.text));
                    },
                  );
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    result = calculator.multiply(
                        int.parse(_firstController.text),
                        int.parse(_secondController.text));
                  });
                },
                icon: const Icon(Icons.cancel_outlined),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    result = calculator.divide(int.parse(_firstController.text),
                        int.parse(_secondController.text));
                  });
                },
                child: const Text('/'),
              ),
            ],
          ),
          const Divider(),
          Text(
            result.toString(),
            key: const ValueKey('result'),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class Calculator {
  int add(int a, int b) => a + b;
  int subtract(int a, int b) => a - b;
  int multiply(int a, int b) => a * b;
  int divide(int a, int b) {
    int result = 0;
    try {
      if (b != 0) {
        result = a ~/ b;
      }
    } catch (e) {}
    return result;
  }
}
