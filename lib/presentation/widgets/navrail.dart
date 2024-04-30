import 'package:ecommerce_app/core/utils/roles.dart';
import 'package:ecommerce_app/presentation/widgets/roleBasedAccessControlWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/nav_controller.dart';

class SafeNavRail extends StatelessWidget {
  SafeNavRail({
    super.key,
  });
  Core core = Core();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 100, // Set the width of the NavigationRail
        child: NavigationRail(
          selectedLabelTextStyle:
              TextStyle(color: Theme.of(context).colorScheme.tertiary),
          unselectedLabelTextStyle:
              TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          indicatorColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedIndex: Get.find<NavigationController>().selectedIndex.value,
          onDestinationSelected: Get.find<NavigationController>().onItemTapped,
          labelType: NavigationRailLabelType.selected,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              selectedIcon: Icon(Icons.home,
                  color: Theme.of(context).colorScheme.tertiary),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              selectedIcon: Icon(Icons.settings,
                  color: Theme.of(context).colorScheme.tertiary),
              label: Text('Settings'),
            ),
            if (core.role == Roles.ADMIN)  NavigationRailDestination(
              icon: Icon(Icons.monetization_on_outlined),
              selectedIcon: Icon(Icons.monetization_on_outlined,
                  color: Theme.of(context).colorScheme.tertiary),
              label: Text('Admin'),
            ),
          ],
        ),
      ),
    );
  }
}
