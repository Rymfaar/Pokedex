import 'package:equatable/equatable.dart';

class Pokemon extends Equatable{
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

  static List<Pokemon> pokemons = [
    const Pokemon(
      id: 0,
      pokedexId: 1,
      name: "Bulbizarre",
      pictureUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
    ),
    const Pokemon(
      id: 1,
      pokedexId: 2,
      name: "Herbizarre",
      pictureUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png",
    ),
  ];
}