import 'package:flutter/material.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "POP Movie Dev",
    baseUrl: "https://api.themoviedb.org/3",
    baseImageUrl: "https://image.tmdb.org/t/p/original",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(const MyApp());
}
