import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mini_pokedex/pokemon_evolution_respons.dart';
import 'package:mini_pokedex/pokemon_page_response.dart';
import 'package:mini_pokedex/pokemon_response.dart';

class PokemonRepo {
  final baseURL = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    final query = {'limit': 200, 'offset': pageIndex * 200}.map((key, value) =>
        MapEntry(key, value.toString()));
    final uri = Uri.https(baseURL, '/api/v2/pokemon', query);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJson(json);
  }

  Future<PokemonResponse> getPokemon(int pokemonId) async {
    final uri = Uri.https(baseURL, '/api/v2/pokemon/$pokemonId');

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonResponse.fromJson(json);
  }

  Future<PokemonEvolutionResponse?> getPokemonEvolution(int id) async {
    final uri = Uri.https(baseURL, '/api/v2/evolution-chain/$id/');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);

      return PokemonEvolutionResponse.fromJson(json);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
