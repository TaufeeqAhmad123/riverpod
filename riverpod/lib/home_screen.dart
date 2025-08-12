import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider((ref) {
  return 'Hello, Riverpod!';
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = ref.watch(hello);
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(child: Text(greeting)),
    );
  }
}
