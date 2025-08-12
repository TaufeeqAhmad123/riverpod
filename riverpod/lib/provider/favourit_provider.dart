import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/model/fav_model.dart';
import 'package:riverpod_state/provider/favouritState.dart';

final favouritProvider = StateNotifierProvider<FavouritNotifier, Favouritstate>(
  (ref) {
    return FavouritNotifier();
  },
);

class FavouritNotifier extends StateNotifier<Favouritstate> {
  FavouritNotifier()
    : super(Favouritstate(allItems: [], filterItems: [], search: ''));

  void addItem() {
    List<FavoriteModel> favItem = [
      FavoriteModel(name: "MacBook", id: 1, isFavourite: false),
      FavoriteModel(name: "iPhone", id: 2, isFavourite: true),
      FavoriteModel(name: "iPad", id: 3, isFavourite: false),
      FavoriteModel(name: "AirPods", id: 4, isFavourite: true),
      FavoriteModel(name: "Apple Watch", id: 5, isFavourite: false),
      FavoriteModel(name: "Samsung Galaxy", id: 6, isFavourite: false),
      FavoriteModel(name: "Dell XPS", id: 7, isFavourite: false),
      FavoriteModel(name: "HP Spectre", id: 8, isFavourite: false),
      FavoriteModel(name: "Sony WH-1000XM5", id: 9, isFavourite: true),
      FavoriteModel(name: "Canon EOS", id: 10, isFavourite: true),
      FavoriteModel(name: "Nikon D750", id: 11, isFavourite: false),
      FavoriteModel(name: "GoPro Hero", id: 12, isFavourite: true),
    ];
    state = state.copyWith(
      allItems: [...state.allItems, ...favItem],
      filterItems: [...state.filterItems, ...favItem],
    );
  }

  void searchItem(String query) {
    state = state.copyWith(filterItems: _filterSearch(state.allItems, query));
  }
  void favouriteItem(String option) {
    state = state.copyWith(filterItems: _filterFavourite(state.allItems, option));
  }

  List<FavoriteModel> _filterSearch(List<FavoriteModel> item, String query) {
    if (query.isEmpty) {
      return item;
    }
    return item
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
  List<FavoriteModel> _filterFavourite(List<FavoriteModel> item, String option) {
    if (option == 'all') {
      return item;
    }
    return item
        .where((item) => item.isFavourite ==true)
        .toList();
        
  }

  void toggleFavourite(int id) {
    final updatedItems = state.allItems.map((item) {
      if (item.id == id) {
        return item.copyWith(isFavourite: !item.isFavourite);
      }
      return item;
    }).toList();
    state = state.copyWith(allItems: updatedItems, filterItems: updatedItems);
  }
}
