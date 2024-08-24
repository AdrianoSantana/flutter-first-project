import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int difficultyLevel;
  const Difficulty({
    super.key,
    required this.difficultyLevel,
  });

  Color getStartColorByDificulty(int starPosition) {
    Color? color =
        difficultyLevel >= starPosition ? Colors.blue : Colors.blue[100];

    return color ?? Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < 5; index++)
          Icon(
            Icons.star,
            color: getStartColorByDificulty(index + 1),
          ),
      ],
    );
  }
}
