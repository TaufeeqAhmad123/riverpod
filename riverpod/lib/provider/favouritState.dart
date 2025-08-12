import 'package:riverpod_state/model/fav_model.dart';

class Favouritstate {
final List<FavoriteModel> allItems;
final List<FavoriteModel> filterItems;
final String search;

Favouritstate({
  required this.allItems,
  required this.filterItems,
  required this.search,
});

Favouritstate copyWith({
  List<FavoriteModel>? allItems,
  List<FavoriteModel>? filterItems,
  String? search,
}) {
  return Favouritstate(
    allItems: allItems ?? this.allItems,
    filterItems: filterItems ?? this.filterItems,
    search: search ?? this.search,
  );
}

}