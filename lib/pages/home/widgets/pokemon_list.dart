import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/pages/home/widgets/pokemon_card.dart';


class PokemonList extends StatelessWidget {
  final List<Pokemon> pokemonList;

  const PokemonList({super.key, required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.white],
            begin: Alignment.center,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4
              ),
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                  final pokemon = pokemonList[index];
                  return PokemonCard(pokemon: pokemon);
                },
              )
            ) 
         ]
        ),
      ),
    );
  }
}
