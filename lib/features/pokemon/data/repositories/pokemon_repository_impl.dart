import 'package:clean_arquitecture_bloc/core/error/failure.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/data/datasources/pokemons_local_datasources.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/data/datasources/pokemons_remote_datasources.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonsRemoteDatasource pokemonsRemoteDatasource;
  final PokemonsLocalDatasource pokemonsLocalDatasource;

  PokemonRepositoryImpl(
      {required this.pokemonsRemoteDatasource,
      required this.pokemonsLocalDatasource});

  @override
  Future<Either<Failure, bool>> addPokemon(Pokemon pokemon) async {
    try {
      final bool resp = await pokemonsLocalDatasource.addPokemon(pokemon);
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure('Error al agregar el pokemon'));
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getAllPokemons() async {
    try {
      final List<Pokemon> resp = await pokemonsLocalDatasource.getAllPokemons();
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure('Error al obtener los pokemons'));
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemonById(int id) async {
    try {
      final resp = await pokemonsRemoteDatasource.getPokemonById(id);
      return Right(resp);
    } on DioError {
      return Left(ServerFailure('Error al obtener el pokemon'));
    }
  }
}
