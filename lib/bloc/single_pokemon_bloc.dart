import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_pokedex/bloc/single_pokemon_event.dart';
import 'package:mini_pokedex/bloc/single_pokemon_state.dart';
import 'package:mini_pokedex/data/pokemon_repo.dart';
import 'package:mini_pokedex/bloc/pokemon_state.dart';
import 'package:mini_pokedex/data/pokemon_response.dart';


class SinglePokemonBloc extends Bloc<SinglePokemonEvent, SinglePokemonState> {
  final _pokemonRepo = PokemonRepo();

  SinglePokemonBloc() : super(SinglePokemonInitialState()) {
    on<PokemonRequest>((event, emit) async {
      emit(SinglePokemonInitialState());

      try {
        final pokemonResponse = await _pokemonRepo.getPokemon(event.pokemonID);
        emit(SinglePokemonSuccessState(
          id: pokemonResponse.id,
          name: pokemonResponse.name,
          imageURL: pokemonResponse.imageURL,

        ));
      } catch (e) {
        emit(SinglePokemonFailedState(error: e.toString()));
        //TODO fix this properly
      }
    });
  }
}
