
abstract class SinglePokemonEvent{}


class PokemonRequest extends SinglePokemonEvent {
  final int pokemonID;

  PokemonRequest({required this.pokemonID});

}

class PokemonRefreshRequest extends SinglePokemonEvent{}
