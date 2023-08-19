import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pokemon.name),
            Image.network(pokemon.imageUrl),
            // Exiba mais informações detalhadas aqui
          ],
        ),
      ),
    );
  }
}
