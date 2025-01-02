class PlayingCard {
  final String suit;
  final int number;

  PlayingCard(this.suit, this.number);

  @override
  String toString() {
    return '$suit $number';
  }
}