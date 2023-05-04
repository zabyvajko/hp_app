import 'package:dio/dio.dart';
import 'package:hp_app/repositories/hp_characters/hp_characters.dart';

class HpCharactersRepository implements AbstractHpCharactersRepository {
  final Dio dio;

  HpCharactersRepository({required this.dio});

  @override
  Future<List<HpCharacters>> getCharactersList() async {
    final response =
        await dio.get('https://hp-api.onrender.com/api/characters');
    final data = List<Map<String, dynamic>>.from(response.data);
    final characterList = data.map((e) {
      return HpCharacters(
        name: e['name'],
        gender: e['gender'],
        house: e['house'],
        image: e['image'],
        species: e['species'],
        alive: e['alive'],
        ancestry: e['ancestry'],
        dateOfBirth: e['dateOfBirth'],
        eyeColour: e['eyeColour'],
        hairColour: e['hairColour'],
        patronus: e['patronus'],
        wand: e['wand'],
        yearOfBirth: e['yearOfBirth'],
      );
    }).toList();
    return characterList;
  }
}
