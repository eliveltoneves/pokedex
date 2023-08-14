import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/pages/home/home_page.dart';

void main() {
  runApp(const Podedex());
}

class Podedex extends StatelessWidget {
  const Podedex({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PokemonModel> pokemonList = [];


    return MaterialApp(
      title: 'Pokedex',
      home: HomePage(pokemonList: pokemonList,),
    );
  }
}
