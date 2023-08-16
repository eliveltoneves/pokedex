import 'package:flutter/material.dart';
import 'package:pokedex/pages/home/home_page.dart';

void main() {
  runApp(const Podedex());
}

class Podedex extends StatelessWidget {
  const Podedex({super.key});

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: HomePage(),
    );
  }
}
