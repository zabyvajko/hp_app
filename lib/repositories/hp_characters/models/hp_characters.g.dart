// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hp_characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HpCharacters _$HpCharactersFromJson(Map<String, dynamic> json) => HpCharacters(
      eyeColour: json['eyeColour'] as String,
      hairColour: json['hairColour'] as String,
      patronus: json['patronus'] as String?,
      ancestry: json['ancestry'] as String,
      wand: json['wand'] as Map<String, dynamic>,
      dateOfBirth: json['dateOfBirth'] as String?,
      yearOfBirth: json['yearOfBirth'] as int?,
      name: json['name'] as String,
      gender: json['gender'] as String,
      house: json['house'] as String,
      image: json['image'] as String,
      species: json['species'] as String,
      alive: json['alive'] as bool,
    );

Map<String, dynamic> _$HpCharactersToJson(HpCharacters instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'house': instance.house,
      'image': instance.image,
      'species': instance.species,
      'alive': instance.alive,
      'eyeColour': instance.eyeColour,
      'hairColour': instance.hairColour,
      'patronus': instance.patronus,
      'ancestry': instance.ancestry,
      'wand': instance.wand,
      'dateOfBirth': instance.dateOfBirth,
      'yearOfBirth': instance.yearOfBirth,
    };
