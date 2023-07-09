import 'package:flutter/material.dart';
import 'package:learn_smart/common/service/storage_service.dart';
import 'package:firebase_core/firebase_core.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    Firebase.initializeApp(
        //options: DefaultFirebaseOptions.currentPlatform,
        );
    storageService = await StorageService().init();
  }
}
