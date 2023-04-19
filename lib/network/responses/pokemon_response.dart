import 'package:pokedex/network/network_utils.dart';
import 'package:pokedex/network/responses/pokemon_ref_response.dart';
import 'package:pokedex/network/responses/stats_response.dart';
import 'package:pokedex/network/responses/type_response.dart';

class PokemonResponse {
  PokemonResponse({
    required this.id,
    required this.pokedexId,
    required this.name,
    required this.image,
    required this.sprite,
    required this.slug,
    required this.stats,
    required this.types,
    required this.generation,
    required this.evolutions,
    required this.preEvolution,
  });

  factory PokemonResponse.fromJson(Json json) {
    return PokemonResponse(
      id: json['id'],
      pokedexId: json['pokedexId'],
      name: json['name'],
      image: json['image'],
      sprite: json['sprite'],
      slug: json['slug'],
      stats: StatsResponse.fromJson(json['stats']),
      types: json['types'].map((e) => TypeResponse.fromJson(e)).toList(),
      generation: json['generation'],
      evolutions: json['evolutions'].map((e) => PokemonRefResponse.fromJson(e)).toList(),
      preEvolution: json['preEvolution'],
    );
  }

  int id;
  int pokedexId;
  String name;
  String image;
  String sprite;
  String slug;
  StatsResponse stats;
  List<TypeResponse> types;
  int generation;
  List<PokemonRefResponse> evolutions;
  PokemonRefResponse preEvolution;
}
