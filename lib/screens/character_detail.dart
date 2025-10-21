import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:harry_potter/widgets/rating.dart';
import 'package:provider/provider.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.characterId});

  final int characterId;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  int lastRating = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<HogwartsData>(
      builder: (context, hogwartsData, child) {
        Character character = hogwartsData.getCharacterById(widget.characterId);
        return Scaffold(
          appBar: AppBar(title: Text("Detalls de ${character.name}")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Image
              Hero(
                tag: character.name,
                child: Image.network(character.imageUrl),
              ),
              //Stars
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Rating(value: character.average),
                  Text("${character.totalReviews} reviews"),
                  InkWell(
                    onTap: () {
                      hogwartsData.toggleFavorite(character.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        character.favorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                    ),
                  ),
                ],
              ),
              //Text
              Text(
                "Harry Potter",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Rating(
                value: lastRating.toDouble(),
                color: Colors.deepPurple,
                onValueClicked: (int value) {
                  lastRating = value;
                  hogwartsData.addRating(character.id, value);
                  setState(() {});
                },
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
        );
      },
    );
  }
}
