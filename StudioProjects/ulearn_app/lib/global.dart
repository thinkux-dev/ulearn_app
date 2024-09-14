import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ulearn_app/common/services/local_storage.dart';

import 'firebase_options.dart';

class Global{
  static late LocalStorageService storageService;

  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    storageService = await LocalStorageService().init();
  }
}