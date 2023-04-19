import 'package:pokedex/network/network_utils.dart';

class PokemonRefResponse {
  PokemonRefResponse({
    required this.name,
    required this.pokedexId,
  });

  factory PokemonRefResponse.fromJson(Json json) {
    return PokemonRefResponse(name: json['name'], pokedexId: json['pokedexId']);
  }

  String name;
  int pokedexId;
}
