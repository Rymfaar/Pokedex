import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final int pokedexId;
  final String name;
  final String pictureUrl;

  const Pokemon({
    required this.id,
    required this.pokedexId,
    required this.name,
    required this.pictureUrl,
  });

  @override
  List<Object?> get props => [id, pokedexId, pictureUrl, name];
}
