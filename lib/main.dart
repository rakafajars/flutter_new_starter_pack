import 'package:flutter/material.dart';
import 'package:flutter_new_starter_pack/config/route_config.dart';
import 'package:flutter_new_starter_pack/ui/pages/leagues/leagues.dart';
import 'package:flutter_new_starter_pack/ui/pages/movie/movie.dart';
import 'package:flutter_new_starter_pack/utils/alice_service.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: alice.getNavigatorKey(),
      debugShowCheckedModeBanner: false,
      routes: RouteConfig.routes,
      title: 'Flutter Starter Pack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationPage(),
    );
  }
}

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final _widgetOptionsPage = [
    MoviePage(),
    LeaguesListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptionsPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_compact),
            label: 'Leagues',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
