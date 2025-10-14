class Character {
  final String name;
  final String imageUrl;
  final int strenght;
  final int magic;
  final int speed;
  int totalReviews = 0;
  int totalRatings = 0;

  double get average => (totalReviews == 0) ? 0 : totalRatings / totalReviews;

  void addRating(int stars) {
    totalReviews++;
    totalRatings += stars;
  }

  Character({
    required this.name,
    required this.imageUrl,
    required this.strenght,
    required this.magic,
    required this.speed,
  });
}

List<Character> characters = [
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
