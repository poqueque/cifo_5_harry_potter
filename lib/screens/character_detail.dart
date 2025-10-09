import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalls de ${character.name}")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Image
            Hero(tag: character.name, child: Image.network(character.imageUrl)),
            //Stars
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star_border),
                    Icon(Icons.star_border),
                  ],
                ),
                Text("89 reviews"),
              ],
            ),
            //Text
            Text(
              "Harry Potter",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.fitness_center, size: 32),
                    Text("Força"),
                    Text("${character.strenght}"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.auto_fix_normal, size: 32),
                    Text("Màgia"),
                    Text("${character.magic}"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.speed, size: 32),
                    Text("Velocitat"),
                    Text("${character.speed}"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
