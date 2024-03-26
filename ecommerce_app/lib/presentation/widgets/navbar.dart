import 'package:ecommerce_app/presentation/pages/home/home.dart';
import 'package:ecommerce_app/presentation/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  NavBar({super.key, this.pageNumber});
  final int? pageNumber;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _index = 0 ;
  
  int? get pageNumber => widget.pageNumber;

  @override
  void initState() {
    if(pageNumber != null){
    _index += pageNumber! ;
    }
    super.initState();
  }
 

  void changePages(int? temp,int? index){
    switch (index) {
          case 0:
            if (temp != index) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }

          case 3:
            if (temp != index) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SettingsPage()));
            }
        }
  }
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      indicatorColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.primary,
      selectedIndex: _index,
      height: 60,
      onDestinationSelected: (index) => setState(() {
          int temp = _index;
          _index = index;
        changePages(temp, index);

        
      }),
      destinations: [
        NavigationDestination(
            icon: Icon(Icons.home_outlined,
                color: _index == 0
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.onSecondary),
            label: "Home"),
        NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined,
                color: _index == 1
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.onSecondary),
            label: "Cart"),
        NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined,
                color: _index == 2
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.onSecondary),
            label: "Orders"),
        NavigationDestination(
            icon: Icon(Icons.person_2_outlined,
                color: _index == 3
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.onSecondary),
            label: "Settings"),
      ],
    );
  }
}
