import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_pokedex/bloc/single_pokemon_state.dart';
import 'package:mini_pokedex/widgets/appbar.dart';
import 'package:mini_pokedex/widgets/bottom_nav_bar.dart';

import 'bloc/single_pokemon_bloc.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({super.key});

  @override
  State<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow[50],
        appBar: buildAppBar(),
        body: BlocBuilder<SinglePokemonBloc, SinglePokemonState>(
            builder: (context, state) {
          if (state is SinglePokemonLoadState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SinglePokemonSuccessState) {
            return Center(
              child: Column(
                children: [
                  Center(
                      child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          state.imageURL,
                          scale: 0.8,
                        ),
                        Text(
                          state.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            );
          } else if (state is SinglePokemonFailedState) {
            return Center(
              child: Text(
                state.error.toString(),
              ),
            );
          } else {
            return Container();
          }
        }),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
