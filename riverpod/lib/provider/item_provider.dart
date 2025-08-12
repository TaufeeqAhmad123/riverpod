import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/model/item_model.dart';

final itemprovider = StateNotifierProvider<ItemProvider, List<ItemModel>>((
  ref,
) {
  return ItemProvider();
});

class ItemProvider extends StateNotifier<List<ItemModel>> {
  ItemProvider() : super([]) {
    void additem(String name) {
      final item = ItemModel(id: DateTime.now().toString(), name: name);
      state.add(item);
      state = state.toList();
    }
  }
}
