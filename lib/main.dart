import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// --- State Class ---
class CounterState extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // Step 2: triggers rebuild pipeline
  }

  void decrement() {
    if (_count > 0) _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

// --- Entry Point ---
void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => CounterState(),
    child: const MaterialApp(home: CounterPage()),
  ),
);

// --- UI ---
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // context.watch subscribes this widget — rebuilds when count changes
    final state = context.watch<CounterState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Assignment')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Current Count:', style: TextStyle(fontSize: 18)),
            Text(
              '${state.count}',
              style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => context.read<CounterState>().decrement(),
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrement'),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () => context.read<CounterState>().increment(),
                  icon: const Icon(Icons.add),
                  label: const Text('Increment'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => context.read<CounterState>().reset(),
              child: const Text('Reset to Zero'),
            ),
          ],
        ),
      ),
    );
  }
}
