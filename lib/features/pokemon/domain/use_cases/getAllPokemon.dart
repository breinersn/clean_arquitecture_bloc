import 'package:clean_arquitecture_bloc/core/error/failure.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllPokemonsUseCase {
  final PokemonRepository repository;

  GetAllPokemonsUseCase(this.repository);

  Future<Either<Failure, List<Pokemon>>> call() {
    return repository.getAllPokemons();
  }
}
