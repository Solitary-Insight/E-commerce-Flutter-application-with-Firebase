import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:t_store/data/repos/authentication/autethentication_repository.dart';
import 'package:t_store/firebase_options.dart';

Future<void> main() async {
  //todo: widgets binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //  todo Initialize Getx Storage
  await GetStorage.init();

  //  todo Await Splash Screen untill items loaded
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

//  todo : Intialiaze Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthencationRepository()));

  runApp(const App());
}
