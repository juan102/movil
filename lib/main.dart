import 'package:ejemplo_1/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'domain/controller/AuthController.dart';
import 'package:firebase_core/firebase_core.dart';
import 'domain/controller/articulosController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ConsultasController());
  Get.put(AuthController());
  runApp(const MyApp());
}
