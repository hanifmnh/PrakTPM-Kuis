import 'package:flutter/material.dart';
import 'package:kuis/pokemon_data.dart';
import 'package:kuis/halaman_detail.dart';

class GridViewPokemon extends StatelessWidget {
  const GridViewPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: listPokemon.length,
        itemBuilder: (context, index) {
          final PokemonData pokemon = listPokemon[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => HalamanDetail(pokemon: pokemon),
              ));
            },
            child: Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 5,
                            child: Image.network(pokemon.image),
                          ),
                          Text(
                            pokemon.name,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
