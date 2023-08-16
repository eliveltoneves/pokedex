import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon_model.dart';

class PokemonService {
  static const pokeAPI = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  

  Future<PokemonModel> fetchPokemonData(pokemonmodel) async {
    final response = await http.get(Uri.parse(pokeAPI));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final pokemonJson = data['pokemon'];
      final pokemon = PokemonModel.fromMap(pokemonJson);
      return pokemon;
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }

  fetchPokemonList() {}
}
