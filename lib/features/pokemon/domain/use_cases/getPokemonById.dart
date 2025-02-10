import 'package:clean_arquitecture_bloc/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/repositories/pokemon_repository.dart';

class GetPokemonByIdUseCase {
  final PokemonRepository repository;

  GetPokemonByIdUseCase(this.repository);

  Future<Either<Failure, Pokemon>> call(int id) async {
    return await repository.getPokemonById(id);
  }
}
