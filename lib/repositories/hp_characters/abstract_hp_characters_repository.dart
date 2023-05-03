import 'package:hp_app/repositories/hp_characters/hp_characters.dart';

abstract class AbstractHpCharactersRepository {
  Future<List<HpCharacters>> getCharactersList();
}