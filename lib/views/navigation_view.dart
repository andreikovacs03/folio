import 'package:flutter/material.dart';
import 'package:folio/core/routes.dart';
import 'package:folio/views/browse_view.dart';
import 'package:folio/views/history_view.dart';
import 'package:folio/views/library_view.dart';
import 'package:folio/views/more_view.dart';

class Destination {
  final String label;
  final Widget view;
  final List<Widget> actions;
  final NavigationDestination navigationDestination;

  const Destination(
      this.label, this.view, this.actions, this.navigationDestination);
}

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int _selectedIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<int, Destination> destinations = {
      0: Destination(
        'Library',
        LibraryView(),
        <Widget>[],
        const NavigationDestination(
          icon: Icon(Icons.collections_bookmark),
          label: 'Library',
          tooltip: "",
        ),
      ),
      1: Destination(
        'History',
        HistoryView(),
        <Widget>[],
        const NavigationDestination(
          icon: Icon(Icons.history),
          label: 'History',
          tooltip: "",
        ),
      ),
      2: Destination(
        'Browse',
        const BrowseView(),
        <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.travel_explore_outlined),
              onPressed: () {
                BrowseSearchRoute().go(context);
              },
            ),
          ),
        ],
        const NavigationDestination(
          icon: Icon(Icons.explore_outlined),
          selectedIcon: Icon(Icons.explore),
          label: 'Browse',
          tooltip: "",
        ),
      ),
      // 3: const Destination(
      //   'More',
      //   MoreView(),
      //   <Widget>[],
      //   NavigationDestination(
      //     icon: Icon(Icons.more_horiz),
      //     label: 'More',
      //     tooltip: "",
      //   ),
      // ),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(destinations[_selectedIndex]!.label),
        actions: destinations[_selectedIndex]!.actions,
      ),
      body: destinations[_selectedIndex]!.view,
      bottomNavigationBar: Builder(builder: (context) {
        return NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
          child: NavigationBar(
            selectedIndex: _selectedIndex,
            animationDuration: const Duration(seconds: 1),
            onDestinationSelected: _onDestinationSelected,
            destinations: destinations.values
                .map((destination) => destination.navigationDestination)
                .toList(),
          ),
        );
      }),
    );
  }
}
