import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/modules/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/views/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokedex App')),
      body: RepositoryProvider(
        create: (context) => PokemonRepository(),
        child: BlocProvider(
          create: (_) =>
              PokemonBloc(pokemonRepository: RepositoryProvider.of<PokemonRepository>(context))..add(PokemonFetched()),
          child: const PokemonsList(),
        ),
      ),
    );
  }
}
