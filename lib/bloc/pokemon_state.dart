import 'package:mini_pokedex/data/pokemon_page_response.dart';

abstract class PokemonState{}

class PokemonInitialState extends PokemonState {}

class PokemonLoadState extends PokemonState {}

class PokemonSuccessState extends PokemonState{
  final List<Pokemons> pokemons;
  final bool loadNext;

  PokemonSuccessState(
  {required this.pokemons, required this.loadNext}
      );

}

class PokemonFailedState extends PokemonState{
   String error;

   PokemonFailedState({required this.error});

}
