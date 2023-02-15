import 'package:flutter/material.dart';
import 'package:flutter_binar_localstorage/counter_shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Jagoflutter Local Storage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Jagoflutter Gmeet ke-4'),
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

  void _getDataCounter() async {
    _counter = await CounterSharedPreferences().getData();
    setState(() {});
  }

  void _incrementCounter() async {
    await CounterSharedPreferences().saveData(++_counter);
    _getDataCounter();
  }

  void _decrementCounter() async {
    await CounterSharedPreferences().saveData(--_counter);
    _getDataCounter();
  }

  void _removeCounter() async {
    await CounterSharedPreferences().removeDate();
    _getDataCounter();
  }

  @override
  void initState() {
    super.initState();
    _getDataCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Value',
              textAlign: TextAlign.center,
            ),
            Text(
              '$_counter',
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _decrementCounter, child: const Text('-')),
                const SizedBox(width: 8),
                ElevatedButton(
                    onPressed: _incrementCounter, child: const Text('+'))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                _removeCounter();
              },
              child: const Text('Clear'),
            )
          ],
        ),
      ),
    );
  }
}
