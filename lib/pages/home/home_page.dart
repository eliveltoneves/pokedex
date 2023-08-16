import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pokeApi =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  List? pokedex;

  @override
  void initState() {
    super.initState();
    fetchPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pokedex?.length ?? 0,
            itemBuilder: (context, index) {
              var pokemon = pokedex?[index];
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9, // 80% da largura da tela
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Card(
                    elevation: 4, // Sombreamento do card
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Borda arredondada
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.indigoAccent], // Gradiente de cores
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12), // Borda arredondada para o container
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              pokemon?['name'] ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Image.network(
                            pokemon?['img'] ?? '',
                            height: 200, // Defina a altura da imagem conforme necessário
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void fetchPokemonData() {
    var url = Uri.https(
        'raw.githubusercontent.com', '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodeJsonData = jsonDecode(value.body);
        setState(() {
          pokedex = decodeJsonData['pokemon'];
        });
      }
    });
  }
}


