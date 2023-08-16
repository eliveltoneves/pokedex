import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon_model.dart';


class PokemonService {
  final String apiUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  Future<List<Pokemon>> fetchPokemonData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final pokemonList = jsonData['pokemon'] as List<dynamic>;

      return pokemonList
          .map((pokemonData) => Pokemon(
                id: pokemonData['id'],
                name: pokemonData['name'],
                imageUrl: pokemonData['img'],
              ))
          .toList();
    } else {
      throw Exception('Failed to load Pokemon data');
    }
  }
}
