import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_state.dart';

class CounterControls extends StatelessWidget {
  const CounterControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // context.read — calls a method WITHOUT subscribing/rebuilding
          ElevatedButton(
            onPressed: () => context.read<CounterState>().decrement(),
            child: const Icon(Icons.remove),
          ),

          const SizedBox(width: 16),

          ElevatedButton(
            onPressed: () => context.read<CounterState>().increment(),
            child: const Icon(Icons.add),
          ),

          const SizedBox(width: 16),

          TextButton(
            onPressed: () => context.read<CounterState>().reset(),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}