// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $navigationRoute,
    ];

GoRoute get $navigationRoute => GoRouteData.$route(
      path: '/',
      factory: $NavigationRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'favoriteBook',
          factory: $FavoriteBookRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'browseSearch',
          factory: $BrowseSearchRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'book',
              factory: $BookRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'pdf/:link',
                  factory: $PdfRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $NavigationRouteExtension on NavigationRoute {
  static NavigationRoute _fromState(GoRouterState state) => NavigationRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $FavoriteBookRouteExtension on FavoriteBookRoute {
  static FavoriteBookRoute _fromState(GoRouterState state) => FavoriteBookRoute(
        id: state.queryParams['id'],
        title: state.queryParams['title'],
        author: state.queryParams['author'],
        mirror_1: state.queryParams['mirror_1'],
      );

  String get location => GoRouteData.$location(
        '/favoriteBook',
        queryParams: {
          if (id != null) 'id': id,
          if (title != null) 'title': title,
          if (author != null) 'author': author,
          if (mirror_1 != null) 'mirror_1': mirror_1,
        },
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $BrowseSearchRouteExtension on BrowseSearchRoute {
  static BrowseSearchRoute _fromState(GoRouterState state) =>
      BrowseSearchRoute();

  String get location => GoRouteData.$location(
        '/browseSearch',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $BookRouteExtension on BookRoute {
  static BookRoute _fromState(GoRouterState state) => BookRoute(
        id: state.queryParams['id'],
        title: state.queryParams['title'],
        author: state.queryParams['author'],
        mirror_1: state.queryParams['mirror_1'],
      );

  String get location => GoRouteData.$location(
        '/browseSearch/book',
        queryParams: {
          if (id != null) 'id': id,
          if (title != null) 'title': title,
          if (author != null) 'author': author,
          if (mirror_1 != null) 'mirror_1': mirror_1,
        },
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $PdfRouteExtension on PdfRoute {
  static PdfRoute _fromState(GoRouterState state) => PdfRoute(
        state.params['link']!,
      );

  String get location => GoRouteData.$location(
        '/browseSearch/book/pdf/${Uri.encodeComponent(link)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
