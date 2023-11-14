import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_pokedex/bloc/pokemon_event.dart';
import 'package:mini_pokedex/pokedex_view.dart';

import 'bloc/pokemon_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context)=> PokemonBloc()..add(PokemonPageRequest(page: 0)))],
        child: PokedexView()),
      

    );
  }
}
