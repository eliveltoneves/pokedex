import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/services/pokemon_service.dart';
import 'package:pokedex/pages/home/widgets/pokemon_list.dart';
import 'home_loading.dart';
import 'home_error.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Pokemon>> _pokemonList;

  @override
  void initState() {
    super.initState();
    _pokemonList = PokemonService().fetchPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100), // Espaçamento para o banner
            SizedBox(
              width: 200,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset('images/pokedex.png'),
              ),
            ), // Imagem do banner
            Expanded(
              child: FutureBuilder<List<Pokemon>>(
                future: _pokemonList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return HomeLoading();
                  } else if (snapshot.hasError) {
                    return HomeError(error: 'Não foi possível carregar a lista de pokemons');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return HomeError(error: '');
                  } else {
                    return PokemonList(pokemonList: snapshot.data!);
                  }
                },
              ),
            ),
          ],
        ),      
    );
  }
}



