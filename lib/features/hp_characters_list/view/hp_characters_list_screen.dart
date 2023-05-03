import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hp_app/features/hp_characters_list/bloc/hp_characters_list_bloc.dart';
import 'package:hp_app/features/hp_characters_list/widgets/widgets.dart';
import 'package:hp_app/repositories/hp_characters/hp_characters.dart';

class HpCharactersListScreen extends StatefulWidget {
  const HpCharactersListScreen({super.key});

  @override
  State<HpCharactersListScreen> createState() => _HpCharactersListScreenState();
}

class _HpCharactersListScreenState extends State<HpCharactersListScreen> {
  final _hpCharactersListBloc =
      HpCharactersListBloc(GetIt.I<AbstractHpCharactersRepository>());

  @override
  void initState() {
    _hpCharactersListBloc.add(LoadHpCharactersList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harry Poter'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _hpCharactersListBloc.add(LoadHpCharactersList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<HpCharactersListBloc, HpCharactersListState>(
            bloc: _hpCharactersListBloc,
            builder: (context, state) {
              if (state is HpCharactersListLoaded) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.hpCharactersList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) {
                    final characterName = state.hpCharactersList[i];
                    return HpCharactersTile(characterName: characterName);
                  },
                );
              }
              if (state is HpCharactersListLoadingFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Something wrong, try again'),
                      const SizedBox(height: 30),
                      OutlinedButton(
                          onPressed: () {
                            _hpCharactersListBloc.add(LoadHpCharactersList());
                          },
                          child: const Text(
                            'Try again',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.yellowAccent,
                            ),
                          )),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
