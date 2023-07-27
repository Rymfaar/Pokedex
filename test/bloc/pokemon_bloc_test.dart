import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';

import '../utils/mock_values.dart';
import 'pokemon_bloc_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late PokemonRepository pokemonRepository;
  late PokemonBloc pokemonBloc;

  setUp(() {
    EquatableConfig.stringify = true;
    pokemonRepository = MockPokemonRepository();
    pokemonBloc = PokemonBloc(pokemonRepository: pokemonRepository);
  });

  group('Pokemon Bloc tests', () {
    blocTest<PokemonBloc, PokemonState>(
      'should succeed in fetching pokemon.',
      setUp: () {
        when(pokemonRepository.fetchPokemons())
            .thenAnswer((_) => Future.value(TestPokemon.pokemons));
      },
      build: () => pokemonBloc,
      act: (bloc) => bloc..add(PokemonFetched()),
      expect: () {
        const state = PokemonState();
        return [
          state.copyWith(
            status: PokemonStatus.success,
            pokemons: TestPokemon.pokemons,
          ),
        ];
      },
    );

    blocTest<PokemonBloc, PokemonState>(
      'should not find pokemon to fetch and fail',
      setUp: () {
        when(pokemonRepository.fetchPokemons())
            .thenAnswer((_) => Future.value([]));
      },
      build: () => pokemonBloc,
      act: (bloc) => bloc..add(PokemonFetched()),
      expect: () {
        const state = PokemonState();
        return [
          state.copyWith(
            status: PokemonStatus.failure,
          ),
        ];
      },
    );

    blocTest<PokemonBloc, PokemonState>(
      'should fail to fetch pokemons after error',
      setUp: () {
        when(pokemonRepository.fetchPokemons())
            .thenThrow(StateError('fail to fetch'));
      },
      build: () => pokemonBloc,
      act: (bloc) => bloc..add(PokemonFetched()),
      expect: () {
        const state = PokemonState();
        return [
          state.copyWith(
            status: PokemonStatus.failure,
          ),
        ];
      },
    );
  });
}
