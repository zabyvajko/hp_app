import 'package:flutter/material.dart';

enum LiveState { alive, dead, unknown }

class HpCharactersStatus extends StatelessWidget {
  final LiveState liveState;
  const HpCharactersStatus({super.key, required this.liveState});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.circle,
          size: 11,
          color: liveState == LiveState.alive
              ? Colors.lightGreenAccent[400]
              : liveState == LiveState.dead
                  ? Colors.red
                  : Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          liveState == LiveState.dead
              ? 'Dead'
              : liveState == LiveState.alive
                  ? 'Alive'
                  : 'Unknown',
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}
