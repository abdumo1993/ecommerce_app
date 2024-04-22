import 'package:ecommerce_app/core/utils/roles.dart';
import 'package:ecommerce_app/presentation/widgets/roleBasedAccessControlWidget.dart';
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
          AccessControlWidget(
            allowedRole: Roles.ADMIN,
            showError: false,
            child: NavigationDestination(
              icon: Icon(Icons.monetization_on_outlined),
              selectedIcon: Icon(Icons.monetization_on_outlined,
                  color: Theme.of(context).colorScheme.tertiary),
              label: 'Admin',
            ),
          ),
        ],
      ),
    );
  }
}

class NavBar2 extends StatefulWidget {
  const NavBar2({super.key});

  @override
  State<NavBar2> createState() => _NavBar2State();
}

class _NavBar2State extends State<NavBar2> {
  late Roles r;
  Core core = Core();
  @override
  void initState() {
    super.initState();
    _initializeRoles(); // Call the new method
  }

  Future<void> _initializeRoles() async {
    await core.setUserData(); // Use await here
    r = core.role!;
    // Optionally, call setState to trigger a rebuild if necessary
    setState(() {});
  }

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
          NavigationDestination(
            icon: Icon(Icons.monetization_on_outlined),
            selectedIcon: Icon(Icons.monetization_on_outlined,
                color: Theme.of(context).colorScheme.tertiary),
            label: 'Admin',
            enabled: r == Roles.ADMIN,
          ),
        ],
      ),
    );
  }
}
