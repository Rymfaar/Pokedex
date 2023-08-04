part of 'pokemon_bloc.dart';

enum PokemonStatus { initial, success, failure }

class PokemonState extends Equatable {
  const PokemonState({
    this.status = PokemonStatus.initial,
    this.pokemons = const <Pokemon>[],
  });

  final PokemonStatus status;
  final List<Pokemon> pokemons;

  PokemonState copyWith({
    PokemonStatus? status,
    List<Pokemon>? pokemons,
  }) {
    return PokemonState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
    );
  }

  @override
  List<Object> get props => [status, pokemons];
}
