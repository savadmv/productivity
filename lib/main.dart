import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/app/app_view.dart';
import 'core/authentication/authentication_repository.dart';
import 'firebase_options.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();

  await registerAdapters();
  var db = FirebaseFirestore.instance;

  Box<User> userBox = await Hive.openBox<User>('userBox');
  Box box = await Hive.openBox('box');
  final authenticationRepository = AuthenticationRepository(userBox: userBox, box: box);
  await authenticationRepository.user.first;
  runApp(MyApp(
    authenticationRepository: authenticationRepository,
  ));
}

registerAdapters() {
  // Register Adapter

  Hive.registerAdapter(UserAdapter());
}
