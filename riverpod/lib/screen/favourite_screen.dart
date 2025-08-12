import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/provider/favourit_provider.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(favouritProvider);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 33),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      ref.read(favouritProvider.notifier).searchItem(value);
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black,width: 3),
                      ),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,width: 3),
                      ),
                    ),
                  ),
                ),
                PopupMenuButton(
                  onSelected: (value) {
                    ref
                              .read(favouritProvider.notifier).favouriteItem(value);
                  },
                  itemBuilder: (context) {
                  return[
                    const PopupMenuItem(
                      value: 'all',
                      child: Text('All',style: TextStyle(fontSize: 16),),
                    ),
                    const PopupMenuItem(
                      value: 'favourites',
                      child: Text('Favourites',style: TextStyle(fontSize: 16),),
                    ),
                  ];
                },)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: item.filterItems.length,
              itemBuilder: (context, index) {
                final favItem = item.filterItems[index];
                return ListTile(
                  title: Text(favItem.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref
                              .read(favouritProvider.notifier)
                              .toggleFavourite(favItem.id);
                        },
                        icon: Icon(
                          favItem.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logic to add a new item
          ref.read(favouritProvider.notifier).addItem();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
