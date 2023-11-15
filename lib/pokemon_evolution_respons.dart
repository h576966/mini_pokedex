class PokemonEvolutionResponse{
  final String name;
  final int lvl;
  
  PokemonEvolutionResponse({required this.name, required this.lvl});
  
  factory PokemonEvolutionResponse.fromJson(Map<String, dynamic> json) {
    return PokemonEvolutionResponse(name: json['chain']['evolves_to'][0]['species']['name'], lvl: json['chain']['evolves_to'][0]['evolution_details']['min_level']);
  }
}
