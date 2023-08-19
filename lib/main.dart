import 'package:flutter/material.dart';
import 'package:pokedex/pages/details/details_page.dart';
import 'package:pokedex/pages/home/home_page.dart';
import 'package:pokedex/utils/app_routes.dart';

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
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home:(context) => HomePage(),
        AppRoutes.details:(context) => DetailsPage()
      },
    );
  }
}
