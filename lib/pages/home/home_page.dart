import 'package:flutter/material.dart';

import '../../models/pokemon_model.dart';
import '../../widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.pokemonList,
  }) : super(key: key);

  final List<PokemonModel> pokemonList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POKÉDEX'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: PokemonList(pokemonList: pokemonList),
      ),
    );
  }  
}
