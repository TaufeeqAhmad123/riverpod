import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/search_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final search = ref.watch(searchProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).searchItem(value);
            },
            decoration: const InputDecoration(hintText: 'Search...'),
          ),
          Consumer(
            builder: (context, ref, child) {
              final search = ref.watch(searchProvider);
              return Text(' ${search.search}');
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final switchValue = ref.watch(searchProvider);
              print('Switch build');
              return Switch(
                value: switchValue.isChange,
                onChanged: (value) {
                  ref.read(searchProvider.notifier).changeItem(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
