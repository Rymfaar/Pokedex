import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon/models/pokemon_model.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc({required this.httpClient}) : super(const PokemonState()) {
    on<PokemonFetched>(
      _onPokemonFetched,
    );
  }

  final http.Client httpClient;

  Future<void> _onPokemonFetched(
    PokemonFetched event,
    Emitter<PokemonState> emit,
  ) async {
    try {
      if (state.status == PokemonStatus.initial) {
        final pokemons = await _fetchPokemons();
        return emit(
          state.copyWith(
            status: PokemonStatus.success,
            pokemons: pokemons,
          ),
        );
      }
      final pokemons = await _fetchPokemons(state.pokemons.length);
      pokemons.isEmpty
          ? emit(state.copyWith(status: PokemonStatus.failure))
          : emit(
              state.copyWith(
                status: PokemonStatus.success,
                pokemons: List.of(state.pokemons)..addAll(pokemons),
              ),
            );
    } catch (_) {
      emit(
        state.copyWith(status: PokemonStatus.failure),
      );
    }
  }

  Future<List<Pokemon>> _fetchPokemons([int startIndex = 0]) async {
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
