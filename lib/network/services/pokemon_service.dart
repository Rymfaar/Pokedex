import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/network/endpoints.dart';
import 'package:pokedex/network/network_utils.dart';
import 'package:pokedex/network/responses/get_all_pokemon_response.dart';
import 'package:pokedex/network/responses/pokemon_response.dart';

class PokemonService {
  final dio = Dio();

  Future<List<PokemonResponse>> getAllPokemons() async {
    final Response response = await dio.get(Endpoint.getAllPokemons);

    if (response.statusCode == 200) {
      final Json result = jsonDecode(response.data);
      return GetAllPokemonResponse.fromJson(result).pokemons;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
