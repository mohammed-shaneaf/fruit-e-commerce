import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/app/fruit_e_commerce.dart';
import 'package:fruit_e_commerce/core/services/get_it_service.dart';
import 'package:fruit_e_commerce/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  runApp(FruitECommerce());
}
