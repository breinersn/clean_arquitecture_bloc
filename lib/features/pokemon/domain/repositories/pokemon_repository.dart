import 'package:clean_arquitecture_bloc/core/error/failure.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/entities/pokemon.dart';
import 'package:dartz/dartz.dart';

abstract class PokemonRepository {
  Future<Either<Failure, Pokemon>> getPokemonById(int id);
  Future<Either<Failure, List<Pokemon>>> getAllPokemons();
  Future<Either<Failure, bool>> addPokemon(Pokemon pokemon);
}
