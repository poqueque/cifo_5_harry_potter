import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';

class HogwartsData extends ChangeNotifier {
  List<Character> characters = [
    Character(
      id: 1,
      name: "Harry Potter",
      imageUrl:
          "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest/scale-to-width-down/1000?cb=20160903184919",
      strenght: 9,
      magic: 9,
      speed: 8,
    ),
    Character(
      id: 2,
      name: "Hermione Granger",
      imageUrl:
          "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1000?cb=20120729103114&path-prefix=es",
      strenght: 9,
      magic: 10,
      speed: 8,
    ),
    Character(
      id: 3,
      name: "Ron Weasley",
      imageUrl:
          "https://i.pinimg.com/1200x/10/4a/91/104a91e06b4c0bef03267a78108fa234.jpg",
      strenght: 7,
      magic: 8,
      speed: 5,
    ),
  ];

  Character getCharacterById(int id) {
    var character = characters.firstWhere((character) => character.id == id);
    return character;
  }

  addRating(int characterId, int stars) {
    Character character = getCharacterById(characterId);
    character.addRating(stars);
    notifyListeners();
  }

  toggleFavorite(int characterId) {
    Character character = getCharacterById(characterId);
    character.toggleFavorite();
    notifyListeners();
  }
}
