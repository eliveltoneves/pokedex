import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:pokedex/services/pokemon_service.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: PokemonService().fetchPokemonList(), // Método para buscar lista de Pokémon
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Exibir indicador de carregamento
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final pokemonList = snapshot.data!;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              final pokemonModel = pokemonList[index];
              return PokemonCard(pokemonModel: pokemonModel);
            },
          );
        } else {
          return Text('No data available.');
        }
      },
    );
  }
}

