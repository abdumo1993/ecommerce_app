import 'package:ecommerce_app/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

import '../../widgets/navbar.dart';
import 'components/searching_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        foregroundColor:Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 70,
        leading: IconButton(
            onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsPage())),
            icon: Icon(
              Icons.person,
            )),
        title: SearchingBar(),
        titleSpacing: 0,
        // leadingWidth: 40,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
        ],
      ),
      body: Body(),
      bottomNavigationBar: NavBar(pageNumber: 0,),
    );
  }
}
