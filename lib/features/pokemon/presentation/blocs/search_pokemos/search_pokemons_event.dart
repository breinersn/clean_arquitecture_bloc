part of 'search_pokemons_bloc.dart';

@immutable
sealed class SearchPokemonsEvent {}

class OnSearchPokemon extends SearchPokemonsEvent {}

class OnCapturePokemon extends SearchPokemonsEvent {
  final Pokemon pokemon;

  OnCapturePokemon({required this.pokemon});
}

class OnGetCapturedsPokemons extends SearchPokemonsEvent {
  OnGetCapturedsPokemons();
}
