import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/widgets/rating.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.character});

  final Character character;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  int lastRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalls de ${widget.character.name}")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Image
          Hero(
            tag: widget.character.name,
            child: Image.network(widget.character.imageUrl),
          ),
          //Stars
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Rating(value: widget.character.average),
              Text("${widget.character.totalReviews} reviews"),
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
              widget.character.addRating(value);
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
                  Text("${widget.character.strenght}"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.auto_fix_normal, size: 32),
                  Text("Màgia"),
                  Text("${widget.character.magic}"),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.speed, size: 32),
                  Text("Velocitat"),
                  Text("${widget.character.speed}"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
