import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${pokemon.id}', style: textTheme.bodySmall),
        title: Text(pokemon.name),
        subtitle: Text(pokemon.pokedexId.toString()),
        trailing: Image.network(pokemon.pictureUrl),
      ),
    );
  }
}
