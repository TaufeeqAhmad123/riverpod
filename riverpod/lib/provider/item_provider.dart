import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/model/item_model.dart';


final itemNotifierProvider =
    StateNotifierProvider<ItemNotifier, List<ItemModel>>((ref) {
      return ItemNotifier();
    });

class ItemNotifier extends StateNotifier<List<ItemModel>> {
  ItemNotifier() : super([]);


  void additem(String name) {
      final item = ItemModel(id: DateTime.now().toString(), name: name);
      state.add(item);
      state = state.toList();
    }
  void deleteitem(String id) {
     state.removeWhere((item)=>item.id == id);
      state = state.toList();
    }
  void updateitem(String id,String name) {
   int findIndex=  state.indexWhere((item)=>item.id == id);
   state[findIndex].name=name;
      state = state.toList();
    }
}
