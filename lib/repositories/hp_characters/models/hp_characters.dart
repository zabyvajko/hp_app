import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hp_characters.g.dart';

@JsonSerializable()
class HpCharacters extends Equatable {
  final String name;
  final String gender;
  final String house;
  final String image;
  final String species;
  final bool alive;
  final String eyeColour;
  final String hairColour;
  final String? patronus;
  final String ancestry;
  final Map wand;
  final String? dateOfBirth;
  final int? yearOfBirth;

  const HpCharacters({
    required this.eyeColour,
    required this.hairColour,
    required this.patronus,
    required this.ancestry,
    required this.wand,
    required this.dateOfBirth,
    required this.yearOfBirth,
    required this.name,
    required this.gender,
    required this.house,
    required this.image,
    required this.species,
    required this.alive,
  });

  factory HpCharacters.fromJson(Map<String, dynamic> json) =>
      _$HpCharactersFromJson(json);
  Map<String, dynamic> toJson() => _$HpCharactersToJson(this);

  @override
  List<Object?> get props => [
        name,
        gender,
        house,
        image,
        species,
        alive,
        eyeColour,
        hairColour,
        patronus,
        ancestry,
        wand,
        dateOfBirth,
        yearOfBirth,
      ];
}
