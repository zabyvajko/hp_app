part of 'hp_characters_list_bloc.dart';

abstract class HpCharactersListState extends Equatable {}

class HpCharactersListInitial extends HpCharactersListState {
  @override
  List<Object?> get props => [];
}

class HpCharactersListLoading extends HpCharactersListState {
  @override
  List<Object?> get props => [];
}

class HpCharactersListLoaded extends HpCharactersListState {
  final List<HpCharacters> hpCharactersList;

  HpCharactersListLoaded({required this.hpCharactersList});
  
  @override
  List<Object?> get props => [hpCharactersList];
}

class HpCharactersListLoadingFailure extends HpCharactersListState {
  final Object? exception;

  HpCharactersListLoadingFailure({required this.exception});
  
  @override
  List<Object?> get props => [exception];
}
