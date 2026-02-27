import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_controls.dart';
import 'counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Method 1: context.watch — subscribes to changes, triggers rebuild
    final counter = context.watch<CounterState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Provider Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Rebuilds automatically when count changes
            Text('Count: ${counter.count}', style: const TextStyle(fontSize: 32)),

            const SizedBox(height: 16),

            // Method 2: Consumer — surgically rebuilds only this subtree
            Consumer<CounterState>(
              builder: (context, state, child) {
                return Text(
                  'Via Consumer: ${state.count}',
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                );
              },
            ),
          ],
        ),
      ),

      // Controls at the bottom
      bottomNavigationBar: const CounterControls(),
    );
  }
}