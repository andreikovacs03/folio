import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'views/browse_search_view.dart';
import 'views/navigation_view.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const NavigationView(),
            ),
        routes: [
          GoRoute(
            path: 'browseSearchView',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const BrowseSearchView(),
            ),
          ),
        ]),
  ],
);

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
