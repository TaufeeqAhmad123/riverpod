class FavoriteModel{
  final int id;
  final String name;
  final bool isFavourite;

  FavoriteModel( {
    required this.id,
    required this.name,
    required this.isFavourite,
  });

  FavoriteModel copyWith({
    int? id,
    String? name,
    bool? isFavourite,
  }) {
    return FavoriteModel(
    
      id: id ?? this.id,
      name: name ?? this.name,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}