import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final int pokedexId;
  final String name;
  final String pictureUrl;
  final bool isLiked;

  const Pokemon({
    required this.id,
    required this.pokedexId,
    required this.name,
    required this.pictureUrl,
    this.isLiked = false,
  });

  @override
  List<Object?> get props => [
        id,
        pokedexId,
        pictureUrl,
        name,
        isLiked,
      ];
}

extension PokemonExtension on Pokemon {
  Pokemon updateLikeStatus(bool isLiked) => Pokemon(
        id: id,
        pokedexId: pokedexId,
        name: name,
        pictureUrl: pictureUrl,
        isLiked: isLiked,
      );
}
