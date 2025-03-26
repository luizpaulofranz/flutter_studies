import 'package:countries_app/router/router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart' show usePathUrlStrategy;

import 'dependency_injection.dart' as di;

void main() {
  // required only for web and is used to remove the # from the url
  // remember, flutter on web is a SPA, so when we change the URL the app does not reload
  // flutter actually handles the History Api of your browser
  if (kIsWeb) usePathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();
  di.registerDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Countries App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router.config(),
    );
  }
}
