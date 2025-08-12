import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});
final switchProvider = StateProvider<bool>((ref) {
  return false;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(
            //we use conumer so that only the counter widget build not the entire widget state
            builder: (context, ref, child) {
              final count = ref.watch(counter);
              print('Counter build');
              return Column(
                children: [
                  Text('Counter: $count', style: TextStyle(fontSize: 24)),
                ],
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final switchValue = ref.watch(switchProvider);
              print('Switch build');
              return Switch(
                value: switchValue,
                onChanged: (value) {
                  ref.read((switchProvider.notifier)).state = value;
                },
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(counter.notifier).state++;
            },
            child: Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(counter.notifier).state--;
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
