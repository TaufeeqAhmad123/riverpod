import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/provider/future_provider.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(futureProvider);
   return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: asyncValue.when(
          data: (data) => Text('Data: $data'),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),)
      ],
    ),
   );
  }
}