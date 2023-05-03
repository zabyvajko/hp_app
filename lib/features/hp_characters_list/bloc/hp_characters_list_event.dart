part of 'hp_characters_list_bloc.dart';


abstract class HpCharactersListEvent extends Equatable {}

class LoadHpCharactersList extends HpCharactersListEvent {
  final Completer? completer;

  LoadHpCharactersList({this.completer});
  
  @override
  List<Object?> get props => [completer];
}
