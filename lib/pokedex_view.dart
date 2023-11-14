
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_pokedex/bloc/pokemon_state.dart';

import 'bloc/pokemon_bloc.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Mini Pokedex'), backgroundColor: Colors.redAccent,
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadState ){
            return const Center(
              child: CircularProgressIndicator(),
            );

          } else if (state is PokemonSuccessState) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: state.pokemons.length,
              itemBuilder: (context, index) {
                return Card(
                  child: GridTile(
                    child: Column(
                      children: [Image.network(state.pokemons[index].imageUrl),
                      Text(state.pokemons[index].name)],
                    )
                  ),
                );
              },
            );

          } else if (state is PokemonFailedState) {
            return Center(child: Text(state.error.toString()),);
          } else {return Container();}


        },
      ),

    );

  }
}
