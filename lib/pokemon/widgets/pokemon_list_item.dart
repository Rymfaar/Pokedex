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
      subtitle: Text(pokemon.pokedexId.toString()),
      trailing: IconButton(
        icon: Icon(pokemon.isLiked ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          context.read<PokemonBloc>().add(PokemonLike(
                isLiked: !pokemon.isLiked,
                pokemon: pokemon,
              ));
          // pokemon.isLiked = !pokemon.isLiked;
        },
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return PokemonPage(pokemon: pokemon);
          },
        ),
      ),
    );
  }
}
