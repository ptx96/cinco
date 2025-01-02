import '../models/card.dart';
import '../models/board.dart';
import '../models/player.dart';

class GameService {
  List<PlayingCard> deck = [];
  List<Player> players;
  PlayingCard? lastExtractedCard; // Track the last extracted card

  GameService(this.players) {
    _initializeDeck();
    _shuffleDeck();
  }

  void _initializeDeck() {
    List<String> suits = ['Cups', 'Coins', 'Clubs', 'Swords'];
    for (String suit in suits) {
      for (int number = 1; number <= 10; number++) {
        deck.add(PlayingCard(suit, number));
      }
    }
  }

  void _shuffleDeck() {
    deck.shuffle();
  }

  PlayingCard? drawCard() {
    if (deck.isNotEmpty) {
      lastExtractedCard = deck.removeLast(); // Update the last extracted card
      return lastExtractedCard;
    }
    return null;
  }

  void markCardOnBoards(PlayingCard card) {
    for (Player player in players) {
      player.board.markCard(card);
    }
  }
}