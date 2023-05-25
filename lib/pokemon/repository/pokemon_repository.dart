import 'dart:convert';

import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  final PokemonDataProvider pokemonDataProvider = PokemonDataProvider(httpClient: http.Client());

  Future<List<Pokemon>> fetchPokemons() async {
    final List<Pokemon> pokemons = await pokemonDataProvider.fetchPokemons();
    return pokemons;
  }
}

class PokemonDataProvider {
  PokemonDataProvider({required this.httpClient});

  final http.Client httpClient;

  Future<List<Pokemon>> fetchPokemons() async {
    final response = await httpClient.get(
      Uri.parse('https://pokebuildapi.fr/api/v1/pokemon/'),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Pokemon(
          id: map['id'] as int,
          name: map['name'] as String,
          pictureUrl: map['image'] as String,
          pokedexId: map['pokedexId'] as int,
        );
      }).toList();
    }
    throw Exception('error fetching pokemons');
  }
}
