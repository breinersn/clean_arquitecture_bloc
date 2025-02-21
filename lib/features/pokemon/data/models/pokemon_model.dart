import 'package:clean_arquitecture_bloc/features/pokemon/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({required super.id, required super.name, required super.image});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
        id: json['id'],
        name: json['name'],
        image: json['sprites']['front_default']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sprites': {'front_default': image}
    };
  }

  factory PokemonModel.fromEntity(Pokemon pokemon) {
    return PokemonModel(
        id: pokemon.id, name: pokemon.name, image: pokemon.image);
  }
}
