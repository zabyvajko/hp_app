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

  const HpCharacters({
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
  List<Object?> get props => [name, gender, house, image, species, alive];
}
