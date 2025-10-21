class Character {
  final int id;
  final String name;
  final String imageUrl;
  final int strenght;
  final int magic;
  final int speed;
  int _totalReviews = 0;
  int _totalRatings = 0;
  bool _favorite = false;
  int get totalReviews => _totalReviews;
  int get totalRating => _totalRatings;
  bool get favorite => _favorite;

  double get average =>
      (_totalReviews == 0) ? 0 : _totalRatings / _totalReviews;

  void addRating(int stars) {
    _totalReviews++;
    _totalRatings += stars;
  }

  void toggleFavorite() {
    _favorite = !favorite;
  }

  Character({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.strenght,
    required this.magic,
    required this.speed,
  });
}
