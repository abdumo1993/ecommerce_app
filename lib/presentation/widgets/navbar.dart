import 'package:ecommerce_app/core/utils/roles.dart';
import 'package:ecommerce_app/presentation/widgets/roleBasedAccessControlWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/nav_controller.dart';

class SafeNavBar extends StatelessWidget {
  SafeNavBar({
    super.key,
  });
  Core core = Core();
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
            if (core.role == Roles.ADMIN) NavigationDestination(
                icon: Icon(Icons.monetization_on_outlined),
                selectedIcon: Icon(Icons.monetization_on_outlined,
                    color: Theme.of(context).colorScheme.tertiary),
                label: 'Admin',
              ),
          ],
      ),
    );
  }
}