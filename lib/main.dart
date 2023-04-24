import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:folio/services/favorites_api.dart';
import 'package:folio/services/book_view_api.dart';
import 'package:go_router/go_router.dart';

import 'core/routes.dart';

void main() async {
  await FavoritesAPI().init();
  await BookViewAPI().init();

  runApp(const MyApp());
}

final _router = GoRouter(routes: $appRoutes);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (context) {
        return MaterialApp.router(
          routerConfig: _router,
          title: 'Folio',
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          debugShowCheckedModeBanner: false,
        );
      },
      maximumSize: const Size(475.0, 812.0),
      enabled: kIsWeb,
      backgroundColor: Colors.grey,
    );
  }
}
