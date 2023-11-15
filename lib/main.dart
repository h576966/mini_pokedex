import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_pokedex/bloc/pokemon_event.dart';
import 'package:mini_pokedex/bloc/single_pokemon_bloc.dart';
import 'package:mini_pokedex/bloc/single_pokemon_event.dart';
import 'package:mini_pokedex/pokedex_view.dart';
import 'package:mini_pokedex/pokemon_view.dart';

import 'bloc/pokemon_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,


      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context)=> PokemonBloc()..add(PokemonPageRequest(page: 0))),
        BlocProvider(create: (context) => SinglePokemonBloc()..add(PokemonRequest(pokemonID: (Random().nextInt(1292)+1))))],
        child: const PokemonView()),
      

    );
  }
}
