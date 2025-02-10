import 'package:bloc/bloc.dart';
import 'package:clean_arquitecture_bloc/core/error/failure.dart';
import 'package:clean_arquitecture_bloc/core/utils/utils.dart' as utils;
import 'package:clean_arquitecture_bloc/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/use_cases/addPokemon.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/use_cases/getAllPokemon.dart';
import 'package:clean_arquitecture_bloc/features/pokemon/domain/use_cases/getPokemonById.dart';
import 'package:meta/meta.dart';

part 'search_pokemons_event.dart';
part 'search_pokemons_state.dart';

class SearchPokemonsBloc
    extends Bloc<SearchPokemonsEvent, SearchPokemonsState> {
  final AddPokemonUseCase _addPokemonUseCase;
  final GetAllPokemonsUseCase _getAllPokemonsUseCase;
  final GetPokemonByIdUseCase _getPokemonByIdUseCase;

  SearchPokemonsBloc(this._addPokemonUseCase, this._getAllPokemonsUseCase,
      this._getPokemonByIdUseCase)
      : super(SearchPokemonsInitial()) {
    on<OnSearchPokemon>((event, emit) async {
      emit(SearchPokemonsLoading());

      final resp = await _getPokemonByIdUseCase(utils.randomInt);

      resp.fold((f) => emit(SearchPokemonFailure(failure: f)),
          (p) => emit(SearchPokemonSuccess(pokemon: p)));
    });
    on<OnCapturePokemon>((event, emit) async {
      final resp = await _addPokemonUseCase(event.pokemon);

      resp.fold((f) => emit(SearchPokemonFailure(failure: f)), (p) {});
    });

    on<OnGetCapturedsPokemons>((event, emit) async {
      final resp = await _getAllPokemonsUseCase();

      resp.fold((f) => emit(SearchPokemonFailure(failure: f)),
          (ps) => emit(SearchPokemonList(pokemons: ps)));
    });
  }
}
