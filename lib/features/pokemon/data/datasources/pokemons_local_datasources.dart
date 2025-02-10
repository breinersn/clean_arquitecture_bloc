import 'package:clean_arquitecture_bloc/core/error/failure.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/data/models/pokemon_model.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PokemonsLocalDatasource {
  Future<bool> addPokemon(Pokemon pokemon);
  Future<List<PokemonModel>> getAllPokemons();
}

class PokemonsLocalDatasourceImpl implements PokemonsLocalDatasource {
  PokemonsLocalDatasourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<List<PokemonModel>> getAllPokemons() async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');
      return box.values.map((e) => PokemonModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure('Error al obtener los pokemons');
    }
  }

  @override
  Future<bool> addPokemon(Pokemon pokemon) async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');
      box.put(pokemon.id, PokemonModel.fromEntity(pokemon).toJson());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure('Error al agregar el pokemon');
    }
  }
}
