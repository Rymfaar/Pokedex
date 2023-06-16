part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PokemonFetched extends PokemonEvent {}

class PokemonLike extends PokemonEvent {
  final bool isLiked;
  final Pokemon pokemon;

  PokemonLike({
    required this.pokemon,
    required this.isLiked,
  });

  @override
  List<Object> get props => [pokemon, isLiked];
}
