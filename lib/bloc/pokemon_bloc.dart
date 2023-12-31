 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_pokedex/bloc/pokemon_event.dart';
import 'package:mini_pokedex/data/pokemon_repo.dart';
import 'package:mini_pokedex/bloc/pokemon_state.dart';


 class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
   final _pokemonRepo = PokemonRepo();

   PokemonBloc() : super(PokemonInitialState()) {
     on<PokemonPageRequest>((event, emit) async {
       emit(PokemonInitialState());

       try {
         final pokemonPageResponse = await _pokemonRepo.getPokemonPage(event.page);
         emit(PokemonSuccessState(
           pokemons: pokemonPageResponse.pokemons,
           loadNext: pokemonPageResponse.loadNext,
         ));
       } catch (e) {
         emit(PokemonFailedState(error: e.toString()));
         //TODO fix this properly
       }
     });
   }
 }
