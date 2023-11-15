
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_pokedex/bloc/pokemon_state.dart';

import 'bloc/pokemon_bloc.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(title: Text('Mini Pokédex',style: TextStyle(
        inherit: true,
        fontSize: 32,
        color: Colors.yellow[600],
          fontFamily: 'Nunito' ,
          shadows: [
        Shadow( // bottomLeft
            offset: const Offset(-2, -2),
            color: Colors.blue[900]!
        ),
        Shadow( // bottomRight
            offset: const Offset(2, -2),
            color: Colors.blue[700]!
        ),
        Shadow( // topRight
            offset: const Offset(2, 2),
            color: Colors.blue[700]!
        ),
        Shadow( // topLeft
            offset: const Offset(-2, 2),
            color: Colors.blue[700]!
        ),
      ]
      ) ,),
        backgroundColor: Colors.red[900],
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadState ){
            return const Center(
              child: CircularProgressIndicator(),
            );

          } else if (state is PokemonSuccessState) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 4),
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
      bottomNavigationBar: BottomNavigationBar(items: const [BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.white) , label: 'Find', ), BottomNavigationBarItem(icon: Icon(Icons.home,  color: Colors.white) , label: 'Home') ], backgroundColor: Colors.black,),

    );

  }
}
