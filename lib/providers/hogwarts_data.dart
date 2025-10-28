import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/services/database.dart';

class HogwartsData extends ChangeNotifier {
  List<Character> characters = [];

  List<Character> initialCharacters = [
    Character(
      name: "Harry Potter",
      imageUrl:
          "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest/scale-to-width-down/1000?cb=20160903184919",
      strenght: 9,
      magic: 9,
      speed: 8,
    ),
    Character(
      name: "Hermione Granger",
      imageUrl:
          "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1000?cb=20120729103114&path-prefix=es",
      strenght: 9,
      magic: 10,
      speed: 8,
    ),
    Character(
      name: "Ron Weasley",
      imageUrl:
          "https://i.pinimg.com/1200x/10/4a/91/104a91e06b4c0bef03267a78108fa234.jpg",
      strenght: 7,
      magic: 8,
      speed: 5,
    ),
  ];

  Future<void> init() async {
    characters = await Database.instance.getAllCharacters();
    if (characters.isEmpty) {
      characters = initialCharacters;
      for (var character in characters) {
        Database.instance.updateCharacter(character);
      }
    }
  }

  Character getCharacterById(int id) {
    var character = characters.firstWhere((character) => character.id == id);
    return character;
  }

  addRating(int characterId, int stars) {
    Character character = getCharacterById(characterId);
    character.addRating(stars);
    Database.instance.updateCharacter(character);
    notifyListeners();
  }

  toggleFavorite(int characterId) {
    Character character = getCharacterById(characterId);
    character.toggleFavorite();
    Database.instance.updateCharacter(character);
    notifyListeners();
  }
}
