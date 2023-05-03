import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hp_app/hp_app.dart';
import 'package:hp_app/repositories/hp_characters/hp_characters.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  GetIt.I.registerLazySingleton<AbstractHpCharactersRepository>(() => HpCharactersRepository(dio: Dio()));
  runApp(const HpApp());
}
