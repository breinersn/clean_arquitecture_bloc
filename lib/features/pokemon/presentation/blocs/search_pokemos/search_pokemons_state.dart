part of 'search_pokemons_bloc.dart';

@immutable
sealed class SearchPokemonsState {}

class SearchPokemonsInitial extends SearchPokemonsState {}

class SearchPokemonsLoading extends SearchPokemonsState {}

final class SearchPokemonSuccess extends SearchPokemonsState {
  final Pokemon pokemon;

  SearchPokemonSuccess({required this.pokemon});
}

final class SearchPokemonList extends SearchPokemonsState {
  final List<Pokemon> pokemons;

  SearchPokemonList({required this.pokemons});
}

final class SearchPokemonFailure extends SearchPokemonsState {
  final Failure failure;

  SearchPokemonFailure({required this.failure});
}
