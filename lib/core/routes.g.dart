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
          path: 'browseSearch',
          factory: $BrowseSearchRouteExtension._fromState,
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
