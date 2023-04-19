import 'package:pokedex/network/network_utils.dart';
import 'package:pokedex/network/responses/pokemon_response.dart';

class GetAllPokemonResponse {
  GetAllPokemonResponse({required this.pokemons});

  factory GetAllPokemonResponse.fromJson(Json json) {
    return GetAllPokemonResponse(
      pokemons: json['pokemons'].map((e) => PokemonResponse.fromJson(e)).toList()
    );
  }

  List<PokemonResponse> pokemons;
}
