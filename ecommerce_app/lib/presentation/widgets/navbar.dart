import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/nav_controller.dart';

class SafeNavBar extends StatelessWidget {
  const SafeNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedIndex: Get.find<NavigationController>().selectedIndex.value,
        onDestinationSelected: Get.find<NavigationController>().onItemTapped,
        // labelType: NavigationRailLabelType.selected,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            selectedIcon: Icon(Icons.settings,
                color: Theme.of(context).colorScheme.tertiary),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}