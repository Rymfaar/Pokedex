import 'package:flutter/material.dart';
import 'package:pokedex/modules/pokemon/models/pokemon_model.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({
    super.key,
    required this.pokemon,
    required this.blocContext,
  });

  final Pokemon pokemon;
  final BuildContext blocContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Column(
        children: [
          Image.network(pokemon.pictureUrl),
        ],
      ),
    );
  }
}
