import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_pokedex/pokemon_page_response.dart';

class PokemonRepo {
  final baseURL = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    final query = {'limit': 200, 'offset': pageIndex * 200}.map((key, value) => MapEntry(key, value.toString()));
    final uri = Uri.https(baseURL, '/api/v2/pokemon', query);

    final respons = await client.get(uri);
    final json = jsonDecode(respons.body);

    return PokemonPageResponse.fromJson(json);
  }
}
