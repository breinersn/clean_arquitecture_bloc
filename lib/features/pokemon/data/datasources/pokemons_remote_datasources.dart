import 'package:clean_arquitecture_bloc/features/pokemon/data/models/pokemon_model.dart';
import 'package:dio/dio.dart';

abstract class PokemonsRemoteDatasource {
  Future<PokemonModel> getPokemonById(int id);
}

class PokemonsRemoteDataSourcesImpl implements PokemonsRemoteDatasource {
  final Dio dio = Dio();

  @override
  Future<PokemonModel> getPokemonById(int id) async {
    final resp = await dio.get('https://pokeapi.co/api/v2/pokemon/$id');
    return PokemonModel.fromJson(resp.data);
  }
}
