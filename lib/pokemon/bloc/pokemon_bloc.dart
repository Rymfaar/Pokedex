import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc({
    required PokemonRepository pokemonRepository,
  })  : _pokemonRepository = pokemonRepository,
        super(const PokemonState()) {
    on<PokemonFetched>(_onPokemonFetched);
    on<PokemonLike>(_onPokemonLiked);
  }

  final PokemonRepository _pokemonRepository;

  Future<void> _onPokemonFetched(
    PokemonFetched event,
    Emitter<PokemonState> emit,
  ) async {
    try {
      final pokemons = await _pokemonRepository.fetchPokemons();
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

  void _onPokemonLiked(
    PokemonLike event,
    Emitter<PokemonState> emit,
  ) {
    try {
      final pokemonIndex = state.pokemons.indexOf(event.pokemon);
      final pokemons = List<Pokemon>.from(state.pokemons);
      pokemons[pokemonIndex] = event.pokemon.updateLikeStatus(event.isLiked);

      emit(
        state.copyWith(
          status: PokemonStatus.success,
          pokemons: pokemons,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(status: PokemonStatus.failure),
      );
    }
  }
}
