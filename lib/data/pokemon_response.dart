class PokemonResponse {
  final int id;
  final String name;
  final String imageURL;


  PokemonResponse( {required this.id, required this.name, required this.imageURL});


  factory PokemonResponse.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name= json['name'];
    final imageURL = json['sprites']['front_default'];

    return PokemonResponse(name: name, id: id, imageURL: imageURL);
  }
}
