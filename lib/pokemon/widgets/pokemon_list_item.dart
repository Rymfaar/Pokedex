import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/views/pokemon_page.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Image.network(pokemon.pictureUrl),
      title: Text(
        pokemon.name,
        style: textTheme.bodyLarge,
      ),
      subtitle: Text(
        pokemon.pokedexId.toString(),
      ),
      trailing: IconButton(
        icon: Icon(pokemon.isLiked ? Icons.favorite : Icons.favorite_border),
        onPressed: () => _onPokemonLiked(context),
      ),
      onTap: () => _onPokemonTap(context),
    );
  }

  void _onPokemonLiked(BuildContext context) {
    context.read<PokemonBloc>().add(
          PokemonLike(
            isLiked: !pokemon.isLiked,
            pokemon: pokemon,
          ),
        );
  }

  void _onPokemonTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PokemonPage(
            pokemon: pokemon,
            blocContext: context,
          );
        },
      ),
    );
  }
}
