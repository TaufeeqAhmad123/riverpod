import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/provider/future_provider.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //here use consumer because if consumer not use every time daya change hole vild method will call and rebuild
          Consumer(
            builder: (context, ref, child) {
              final postList = ref.watch(futureProvider);
              return postList.when(
              
                data: (data) =>Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(item.id.toString()),
                        ),
                        title: Text(item.title),
                        subtitle: Text(item.body),
                      );
                    },
                  ),
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.invalidate(futureProvider); // Refresh the provider to fetch new data
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
