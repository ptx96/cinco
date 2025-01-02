import 'package:flutter/material.dart';
import '../models/card.dart';

class CardWidget extends StatelessWidget {
  final PlayingCard card;

  CardWidget(this.card);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1), // Reduce margin between cards
      decoration: BoxDecoration(
        color: Colors.white, // Card background color
        border: Border.all(color: Colors.black, width: 1), // Card border
        borderRadius: BorderRadius.circular(4), // Slightly rounded corners
      ),
      child: Center(
        child: Text(
          card.toString(),
          style: TextStyle(
            fontSize: 12, // Reduce font size
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}