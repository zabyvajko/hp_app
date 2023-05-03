import 'package:flutter/material.dart';
import 'package:hp_app/repositories/hp_characters/hp_characters.dart';

class HpCharactersTile extends StatelessWidget {
  const HpCharactersTile({
    super.key,
    required this.characterName,
  });

  final HpCharacters characterName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(
        characterName.image,
        height: 50,
        width: 50,
        errorBuilder: (context, error, stackTrace) {
      return const SizedBox(
        height: 50,
        width: 50,
        child: Icon(Icons.error),
      );
    },
      ),
      title: Text(
        characterName.name,
        style: theme.textTheme.bodyMedium,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/character',
          arguments: characterName,
        );
      },
    );
  }
}