import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/modules/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/widgets/pokemon_list_item.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({super.key});

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        switch (state.status) {
          case PokemonStatus.failure:
            return const Center(child: Text('failed to fetch Pokemons'));
          case PokemonStatus.success:
            if (state.pokemons.isEmpty) {
              return const Center(child: Text('no Pokemons'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return PokemonListItem(pokemon: state.pokemons[index]);
              },
              itemCount: state.pokemons.length,
            );
          case PokemonStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
