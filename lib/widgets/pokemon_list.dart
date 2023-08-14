import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key, required this.pokemonList}) : super(key: key);

  final List<PokemonModel> pokemonList; // Use PokemonModel em vez de Map<String, dynamic>

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        final pokemonModel = pokemonList[index]; // Pega o Pokémon da lista

        return PokemonCard(pokemonModel: pokemonModel); // Passa o Pokémon correto
      },
    );
  }
}

