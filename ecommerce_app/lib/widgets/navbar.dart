import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _index,
      height: 60,
      onDestinationSelected: (index) => setState(() {
        _index = index;
      }),
      destinations: [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
        NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined), label: "Cart"),
        NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined), label: "Orders"),
        NavigationDestination(
            icon: Icon(Icons.person_2_outlined), label: "Settings"),
      ],
    );
  }
}
