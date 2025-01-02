import 'package:flutter/material.dart';
import '../models/board.dart';
import 'card_widget.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final double cardSize;

  BoardWidget(this.board, {required this.cardSize});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(), // Disable scrolling
      padding: EdgeInsets.zero, // Remove padding
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // 5 columns
        childAspectRatio: 1, // Make cards square
        mainAxisSpacing: 0, // Remove spacing between rows
        crossAxisSpacing: 0, // Remove spacing between columns
      ),
      itemCount: 25, // 5x5 grid
      itemBuilder: (context, index) {
        int row = index ~/ 5;
        int col = index % 5;
        return SizedBox(
          width: cardSize, // Set card width
          height: cardSize, // Set card height
          child: CardWidget(board.grid[row][col]),
        );
      },
    );
  }
}