import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/models/type_colors.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);
  
  get child => null;

  @override
  Widget build(BuildContext context) {
    var type = pokemon.type[0];
    return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            color: TypeColors.getColorForType(type),
            child: Stack(
              children: [
                Positioned(
                  bottom: -10,
                  right: -10,
                  child: Image.asset('images/pokeball.png',
                  height: 100,
                  fit: BoxFit.fitHeight
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    pokemon.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white
                    ),
                  )
                ),
                Positioned(
                  top: 30,
                  left: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.black26,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 4, bottom: 4),
                      child: Text(
                        type,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  )
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Image.network(
                      pokemon.imageUrl,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                ),
              ],
            ),
        );
  }
}
