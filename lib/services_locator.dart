import 'package:clean_arquitecture_bloc/features/pokemon/data/datasources/pokemons_local_datasources.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/data/datasources/pokemons_remote_datasources.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/use_cases/addPokemon.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/use_cases/getAllPokemon.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/use_cases/getPokemonById.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/presentation/blocs/search_pokemos/search_pokemons_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => SearchPokemonsBloc(
      sl(),
      sl(),
      sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => AddPokemonUseCase(sl()));
  sl.registerLazySingleton(() => GetAllPokemonsUseCase(sl()));
  sl.registerLazySingleton(() => GetPokemonByIdUseCase(sl()));

  // Repository
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      pokemonsRemoteDatasource: sl(),
      pokemonsLocalDatasource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<PokemonsLocalDatasource>(
    () => PokemonsLocalDatasourceImpl(),
  );

  sl.registerLazySingleton<PokemonsRemoteDatasource>(
    () => PokemonsRemoteDataSourcesImpl(),
  );
}
