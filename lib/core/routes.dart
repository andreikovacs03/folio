import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/extensions/libgen_api.dart';
import '../views/book_view.dart';
import '../views/browse_search_view.dart';
import '../views/navigation_view.dart';

part 'routes.g.dart';

@TypedGoRoute<NavigationRoute>(path: '/', routes: [
  TypedGoRoute<BrowseSearchRoute>(
    path: 'browseSearch',
    routes: [
      TypedGoRoute<BookRoute>(
        path: 'book',
      ),
    ],
  )
])
@immutable
class NavigationRoute extends GoRouteData {
  static const _key = ValueKey("/");

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(
        key: _key,
        child: NavigationView(),
      );
}

@immutable
class BrowseSearchRoute extends GoRouteData {
  static const _key = ValueKey("/browseSearch");

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(
        key: _key,
        child: BrowseSearchView(),
      );
}

class BookRoute extends GoRouteData {
  static const _key = ValueKey("/browseSearch/book");

  BookRoute({this.$extra});
  final Book? $extra;

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage<void>(
        key: _key,
        child: BookView(book: $extra as Book),
      );
}
