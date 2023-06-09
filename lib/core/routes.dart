import 'package:flutter/material.dart';
import 'package:folio/views/pdf_view.dart';
import 'package:go_router/go_router.dart';

import '../services/extensions/models.dart';
import '../views/book_page_view.dart';
import '../views/browse_search_view.dart';
import '../views/navigation_view.dart';

part 'routes.g.dart';

@TypedGoRoute<NavigationRoute>(path: '/', routes: [
  TypedGoRoute<FavoriteBookRoute>(path: 'favoriteBook'),
  TypedGoRoute<HistoryBookRoute>(path: 'historyBook'),
  TypedGoRoute<BrowseSearchRoute>(
    path: 'browseSearch',
    routes: [
      TypedGoRoute<BookRoute>(
          path: 'book', routes: [TypedGoRoute<PdfRoute>(path: 'pdf/:link')]),
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
  final String? id;
  final String? title;
  final String? author;
  final String? mirror_1;

  BookRoute({this.id, this.title, this.author, this.mirror_1});

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage<void>(
        key: _key,
        child: BookPageView(
          book: Book(id: id, title: title, author: author, mirror_1: mirror_1),
        ),
      );
}

class FavoriteBookRoute extends GoRouteData {
  static const _key = ValueKey("/favoriteBook");
  final String? id;
  final String? title;
  final String? author;
  final String? mirror_1;

  FavoriteBookRoute({this.id, this.title, this.author, this.mirror_1});

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage<void>(
        key: _key,
        child: BookPageView(
          book: Book(id: id, title: title, author: author, mirror_1: mirror_1),
        ),
      );
}

class HistoryBookRoute extends GoRouteData {
  static const _key = ValueKey("/historyBook");
  final String? id;
  final String? title;
  final String? author;
  final String? mirror_1;

  HistoryBookRoute({this.id, this.title, this.author, this.mirror_1});

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage<void>(
        key: _key,
        child: BookPageView(
          book: Book(id: id, title: title, author: author, mirror_1: mirror_1),
        ),
      );
}

class PdfRoute extends GoRouteData {
  static const _key = ValueKey("/browseSearch/book/pdf/:link");
  final String link;

  PdfRoute(this.link);

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage<void>(
        key: _key,
        child: PdfView(link: link),
      );
}
