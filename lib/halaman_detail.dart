import 'package:flutter/material.dart';
import 'package:kuis/pokemon_data.dart';

class HalamanDetail extends StatefulWidget {
  final PokemonData pokemon;

  const HalamanDetail({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(widget.pokemon.name),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.favorite_border,
              ),
              tooltip: 'Add to favorite',
              onPressed: () {
                if (widget.pokemon.isFavorite == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Berhasil Menambahkan ke Favorit'),
                      backgroundColor: Colors.black,
                    ),
                  );
                  widget.pokemon.isFavorite = true;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Berhasil Menghapus dari Favorit'),
                      backgroundColor: Colors.black,
                    ),
                  );
                  widget.pokemon.isFavorite = false;
                }
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Image.network(
                widget.pokemon.image,
                fit: BoxFit.fitHeight,
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 16),
                Text(
                  widget.pokemon.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Type',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.pokemon.type[0]),
                const SizedBox(height: 16),
                const Text(
                  'Weakness',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.pokemon.weakness[0]),
                const SizedBox(height: 16),
                const Text(
                  'Previous Evolution',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.pokemon.prevEvolution[0]),
                const SizedBox(height: 16),
                const Text(
                  'Next Evolution',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.pokemon.nextEvolution[0]),
              ],
            ),
          ],
        )
    );
  }
}

