import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For SystemNavigator
import '../models/card.dart';
import '../models/board.dart';
import '../models/player.dart';
import '../services/game_service.dart';
import '../widgets/board_widget.dart';
import '../widgets/card_widget.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameService gameService;

  @override
  void initState() {
    super.initState();
    List<Player> players = [
      Player('Player 1', _createBoard()),
      Player('Player 2', _createBoard()),
    ];
    gameService = GameService(players);
  }

  Board _createBoard() {
    List<List<PlayingCard>> grid = List.generate(5, (i) => List.generate(5, (j) => PlayingCard('Cups', i * 5 + j + 1)));
    return Board(grid);
  }

  void _drawCard() {
    setState(() {
      gameService.drawCard();
      if (gameService.lastExtractedCard != null) {
        gameService.markCardOnBoards(gameService.lastExtractedCard!);
      }
    });
  }

  void _showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Return to Home'),
                onTap: () {
                  Navigator.pop(context); // Close the menu
                  Navigator.pop(context); // Return to home screen
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Exit Game'),
                onTap: () {
                  Navigator.pop(context); // Close the menu
                  SystemNavigator.pop(); // Exit the app
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the available height for the grid
    double screenHeight = MediaQuery.of(context).size.height;
    double deckHeight = 100; // Approximate height of the deck section
    double buttonHeight = 100; // Approximate height of the buttons section
    double availableHeight = screenHeight - deckHeight - buttonHeight - 100; // Add some padding

    // Calculate the card size based on the available height
    double cardSize = availableHeight / 5;

    return Scaffold(
      // Remove the AppBar
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green[800], // Green poker table background
        ),
        child: Column(
          children: [
            // Deck at the top
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[900],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(16), // Add margin for spacing
              child: Text(
                'Deck: ${gameService.deck.length} cards',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Last extracted card
            if (gameService.lastExtractedCard != null)
              CardWidget(gameService.lastExtractedCard!),
            SizedBox(height: 20),
            // 5x5 grid of cards
            Expanded(
              child: Center(
                child: Container(
                  width: cardSize * 5, // Total width of the grid
                  height: cardSize * 5, // Total height of the grid
                  color: Colors.green[900], // Match the background color
                  child: BoardWidget(
                    gameService.players[0].board,
                    cardSize: cardSize, // Pass the cardSize parameter
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Draw Card button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _drawCard,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Draw Card'),
              ),
            ),
            // Options menu button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => _showOptionsMenu(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Options'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}