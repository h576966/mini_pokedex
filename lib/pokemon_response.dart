class Pokemon{
  final int id;
  final String name;
  final String imageURL;

  Pokemon({required this.id, required this.name, required this.imageURL});

  factory Pokemon.fromJson(Map<String,dynamic> json){
    final id = json['id'];
    final name = json['name'];
    final imageURL = json['url'] as String;

    return Pokemon(id: id, name: name, imageURL: imageURL);
  }
}

class PokemonResponse {
  //final Pokemon pokemon;
  final int id;
  final String name;
  final String imageURL;


  PokemonResponse( {required this.id, required this.name, required this.imageURL});
     // {required this.pokemon}
     // );

  factory PokemonResponse.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name= json['name'];
    final imageURL = json['sprites']['front_default'];

    return PokemonResponse(name: name, id: id, imageURL: imageURL);
  }
}
