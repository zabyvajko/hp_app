// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hp_characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HpCharacters _$HpCharactersFromJson(Map<String, dynamic> json) => HpCharacters(
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
    };
