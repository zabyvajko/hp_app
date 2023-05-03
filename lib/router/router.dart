import 'package:hp_app/features/hp_character/hp_character.dart';
import 'package:hp_app/features/hp_characters_list/hp_characters_list.dart';

final routes = {
  '/': (context) => const HpCharactersListScreen(),
  '/character': (context) => const HpCharacterScreen(),
};
