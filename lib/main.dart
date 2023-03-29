import 'package:flutter/material.dart';
import 'package:folio/services/favorites_api.dart';
import 'package:go_router/go_router.dart';

import 'core/routes.dart';

void main() async {
  await FavoritesAPI().init();

  runApp(const MyApp());
}

final _router = GoRouter(routes: $appRoutes);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Folio',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}
