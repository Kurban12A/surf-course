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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(0, 255, 255, 255)),
        useMaterial3: true,
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
  int _incrementCounters = 0;
  int _removeIncrementCounters = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _incrementCounters++;
    });
  }

  void _removeincrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _removeIncrementCounters++;
      } else {
        _removeIncrementCounters++;
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
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('$_incrementCounters'),
          const SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Прибавить',
            child: const Icon(Icons.add_circle, color: Colors.black,),
          ),
          const SizedBox(width: 10,),
          Text('$_removeIncrementCounters'),
          const SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: _removeincrementCounter,
            tooltip: 'Отнять',
            child: const Icon(Icons.remove_circle, color: Colors.black,),
          ),
        ],
      ),
    );
  }
}
