part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<Pokemon> pokemons;

  const PokemonLoaded({
    required this.pokemons,
  });

  @override
  List<Object> get props => [
        pokemons,
      ];
}
