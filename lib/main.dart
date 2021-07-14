import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'src/di/injection.dart';
import 'src/ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection(Environment.prod);
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) {
      // exit(1);
    }
  };

  runApp(App());
}
