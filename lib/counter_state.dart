import 'package:flutter/foundation.dart';

class CounterState extends ChangeNotifier {
  int _count = 0;

  // Public getter — read-only access from the UI
  int get count => _count;

  // Increment the counter and notify listeners
  void increment() {
    _count++;
    notifyListeners(); // Triggers UI rebuild
  }

  // Decrement the counter
  void decrement() {
    if (_count > 0) _count--;
    notifyListeners();
  }

  // Reset to zero
  void reset() {
    _count = 0;
    notifyListeners();
  }
}