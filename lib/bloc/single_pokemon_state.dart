

abstract class SinglePokemonState{


}

class SinglePokemonInitialState extends SinglePokemonState {}

class SinglePokemonLoadState extends SinglePokemonState {}

class SinglePokemonSuccessState extends SinglePokemonState{
  final int id;
  final String name;
  final String imageURL;

  SinglePokemonSuccessState({required this.id, required this.name, required this.imageURL});
}

class SinglePokemonFailedState extends SinglePokemonState{
  String error;

  SinglePokemonFailedState({required this.error});

}
