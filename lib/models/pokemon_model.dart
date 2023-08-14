class PokemonModel {
  final int id;
  final String name;
  final String img;    

  PokemonModel({
    required this.name,
    required this.img, 
    required this.id,
  });

  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      img: json['img'],
      name: json['name'],
    );
  }
}
