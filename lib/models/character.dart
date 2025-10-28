import 'package:isar_community/isar.dart';

part 'character.g.dart';

@collection
class Character {
  Id id = Isar.autoIncrement;
  final String name;
  final String imageUrl;
  final int strenght;
  final int magic;
  final int speed;
  int totalReviews = 0;
  int totalRatings = 0;
  bool favorite = false;

  @ignore
  double get average => (totalReviews == 0) ? 0 : totalRatings / totalReviews;

  void addRating(int stars) {
    totalReviews++;
    totalRatings += stars;
  }

  void toggleFavorite() {
    favorite = !favorite;
  }

  Character({
    required this.name,
    required this.imageUrl,
    required this.strenght,
    required this.magic,
    required this.speed,
  });
}
