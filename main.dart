import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
final int counter;
final VoidCallback onIncrement;

const Counter({
super.key,
required this.counter,
required this.onIncrement
});

@override
Widget build(BuildContext context) {
return Row(
mainAxisAlignment: MainAxisAlignment.center, // Para center yung row elements
children: <Widget>[
ElevatedButton(
onPressed: onIncrement, // Ito yung callback function kapag na-click
child: const Text('Increment'), // Text ng button
),
const SizedBox(width: 16), // Space sa pagitan ng button at text
Text('Count: $counter'), // Display ng count value
],
);
}
}

class CounterApp extends StatefulWidget {
const CounterApp({super.key});

@override
State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
int _counter = 0; // Dito na tayo mag-store ng state

void _incrementCounter() {
setState(() {
_counter++; // Update ng counter pag na-click
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: Center(
child: Counter(
counter: _counter, // I-pass yung current counter value sa stateless widget
onIncrement: _incrementCounter, // Callback function to update the counter
),
),
);
}
}

void main() {
runApp(
const MaterialApp(
home: CounterApp(), // Dito natin i-run yung app with the parent widget
),
);
}