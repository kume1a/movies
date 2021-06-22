import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:injectable/injectable.dart';

import 'src/di/injection.dart';
import 'src/infrastructure/hive_box_holder.dart';
import 'src/infrastructure/managers/cache_manager.dart';
import 'src/ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await getIt<HiveBoxHolder>().init();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
  await FlutterDownloader.initialize();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) {
      // exit(1);
    }
  };
  runApp(App());
  getIt<CacheManager>().configureCache();
}
