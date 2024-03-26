import 'package:ecommerce_app/widgets/navbar.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Body(),
      bottomNavigationBar: NavBar(pageNumber: 3,),
    );
  }
}