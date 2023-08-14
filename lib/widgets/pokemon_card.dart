import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/pages/home/home_loading.dart';


class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemonModel,
  }) : super(key: key);
  final PokemonModel pokemonModel;
  
  

  @override
  Widget build(BuildContext context) {
     return  FutureBuilder<PokemonModel>(
      future: Future.value(pokemonModel),
      builder: (context, snaphot) {
        if (snaphot.connectionState == ConnectionState.waiting ) {
          return const HomeLoading();
        } else if (snaphot.hasError) {
          return Text('Error: ${snaphot.error}');
        } else {          
          return Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey[300],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 8.0),
                  Text(pokemonModel.name),
                  Image.network(pokemonModel.img, width: 80, height: 80,), // Exibir a imagem do Pokémon
                ],
              ),
            ),
          );
        }
      }
    );    
  }
}
