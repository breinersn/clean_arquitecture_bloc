import 'package:clean_arquitecture_bloc/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/repositories/pokemon_repository.dart';

class AddPokemonUseCase {
  final PokemonRepository repository;

  AddPokemonUseCase(this.repository);

  Future<Either<Failure, void>> call(Pokemon pokemon) async {
    return await repository.addPokemon(pokemon);
  }
}
