import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/repositories/hp_characters/hp_characters.dart';

part 'hp_characters_list_event.dart';
part 'hp_characters_list_state.dart';

class HpCharactersListBloc
    extends Bloc<HpCharactersListEvent, HpCharactersListState> {
  HpCharactersListBloc(this.hpCharactersRepository)
      : super(HpCharactersListInitial()) {
    on<LoadHpCharactersList>((event, emit) async {
      try {
        if (state is! HpCharactersListLoaded) {
          emit(HpCharactersListLoading());
        }
        final hpCharactersList =
            await hpCharactersRepository.getCharactersList();
        emit(HpCharactersListLoaded(hpCharactersList: hpCharactersList));
      } catch (e) {
        emit(HpCharactersListLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractHpCharactersRepository hpCharactersRepository;
}
