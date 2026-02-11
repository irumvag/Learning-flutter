import 'package:flutter/material.dart';

// Step 1: main() is the entry point of every Dart/Flutter app.
// runApp() takes a widget and makes it the root of the widget tree.
void main() {
  runApp(const MyApp());
}

// Step 2: MyApp is a StatelessWidget (it doesn't change over time).
// It returns a MaterialApp, which sets up the app's theme and home screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      home: const HelloWorldPage(),
    );
  }
}

// Step 3: HelloWorldPage is the screen the user sees.
// It uses a Scaffold (which gives us an app bar and body area).
class HelloWorldPage extends StatelessWidget {
  const HelloWorldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar is the toolbar at the top of the screen
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My First Flutter App'),
      ),
      // body is the main content area
      body: const Center(
        // Center widget places its child in the middle of the screen
        child: Text(
          'Hello, World!',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
