import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final int pokedexId;
  final String name;
  final String pictureUrl;
  bool isLiked;

  Pokemon({
    required this.id,
    required this.pokedexId,
    required this.name,
    required this.pictureUrl,
    this.isLiked = false,
  });

  @override
  List<Object?> get props => [id, pokedexId, pictureUrl, name];
}
