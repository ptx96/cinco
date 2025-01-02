import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for SystemNavigator
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set the background color to blue
      body: Column(
        children: [
          // Title at the top center
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Text(
                'SINCO',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Buttons in the center
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the game screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GameScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber, // Button color
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text('Start Game'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Show instructions
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Instructions'),
                          content: Text(
                              '1. Each player gets a 5x5 board of Sicilian cards.\n'
                              '2. Cards are drawn one by one from the deck.\n'
                              '3. Mark the card on your board if it matches.\n'
                              '4. The first player to mark a complete row, column, or diagonal wins!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber, // Button color
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text('Instructions'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Exit the app
                      SystemNavigator.pop(); // Use this to exit the app
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber, // Button color
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text('Exit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}