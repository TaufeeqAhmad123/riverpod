
import 'package:riverpod/riverpod.dart';
final searchProvider=StateNotifierProvider<searchnotifier, searchhState>((ref){
return searchnotifier();
});

class searchnotifier extends StateNotifier<searchhState> {
  searchnotifier():super(searchhState(search: '', isChange: false)) {
    // Initial state can be set here if needed
  }


  void searchItem(String value) {
    state = state.copyWith(search: value);
  }
  void changeItem(bool isChange) {
    state = state.copyWith(isChange: isChange);
  }
}



class searchhState{
  final String search;
  final bool isChange;

  searchhState({
    required this.search,
    required this.isChange,
  });

  searchhState copyWith({
    String? search,
    bool? isChange,
  }) {
    return searchhState(
      search: search ?? this.search,
      isChange: isChange ?? this.isChange,
    );
  }

}