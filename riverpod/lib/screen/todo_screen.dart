import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/provider/item_provider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemNotifierProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(item[index].name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    ref
                        .read(itemNotifierProvider.notifier)
                        .deleteitem(item[index].id);
                  },
                  icon: Icon(Icons.delete),
                ),
                IconButton(
                  onPressed: () {
                    ref
                        .read(itemNotifierProvider.notifier)
                        .updateitem(item[index].id, 'khan');
                  },
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logic to add a new item
          ref
              .read(itemNotifierProvider.notifier)
              .additem('New Item ${item.length + 1}');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
