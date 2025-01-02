import 'card.dart';

class Board {
  List<List<PlayingCard>> grid;

  Board(this.grid);

  void markCard(PlayingCard card) {
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        if (grid[i][j].suit == card.suit && grid[i][j].number == card.number) {
          grid[i][j] = PlayingCard('Marked', 0);
        }
      }
    }
  }
}