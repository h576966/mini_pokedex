
class Pokemons{
  final int id;
  final String name;

  String get imageUrl => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";

  Pokemons({required this.id, required this.name});

  factory Pokemons.fromJson(Map<String,dynamic> json){
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return Pokemons(id: id, name: name);
  }
}

class PokemonPageResponse {
  final List<Pokemons> pokemons;
  final bool loadNext;

  PokemonPageResponse(
  {required this.pokemons, required this.loadNext}
      );

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final pokemons = (json['results'] as List).map((listingJson) => Pokemons.fromJson(listingJson)).toList();
    final loadNext = json['next'] != null;

    return PokemonPageResponse(pokemons: pokemons, loadNext: loadNext);
  }
}
