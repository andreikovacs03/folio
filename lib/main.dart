import 'package:flutter/material.dart';
import 'package:folio/screens/browse.dart';
import 'package:folio/screens/history.dart';
import 'package:folio/screens/library.dart';
import 'package:folio/screens/more.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Folio',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(title: 'Library'),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    LibraryScreen(),
    HistoryScreen(),
    BrowseScreen(),
    MoreScreen(),
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Builder(builder: (context) {
        return NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
          child: NavigationBar(
            selectedIndex: _selectedIndex,
            animationDuration: const Duration(seconds: 1),
            onDestinationSelected: _onDestinationSelected,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.collections_bookmark),
                label: 'Library',
                tooltip: "",
              ),
              NavigationDestination(
                icon: Icon(Icons.history),
                label: 'History',
                tooltip: "",
              ),
              NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore),
                label: 'Browse',
                tooltip: "",
              ),
              NavigationDestination(
                icon: Icon(Icons.more_horiz),
                label: 'More',
                tooltip: "",
              ),
            ],
          ),
        );
      }),
    );
  }
}
