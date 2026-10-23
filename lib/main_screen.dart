  import 'package:flutter/material.dart';
  import 'package:go_router/go_router.dart';

  class MainScreen extends StatelessWidget {
    final StatefulNavigationShell navigationShell;
    const new({super.key, required this.navigationShell});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (value) {
            navigationShell.goBranch(value);
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: "Search",
            ),
            NavigationDestination(
              icon: Icon(Icons.book_online_outlined),
              selectedIcon: Icon(Icons.book_online),
              label: "Booking",
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_none_outlined),
              selectedIcon: Icon(Icons.notifications_none),
              label: "Notification",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outlined),
              selectedIcon: Icon(Icons.person),
              label: "Profil",
            ),
          ],
        ),
      );
    }
  }
