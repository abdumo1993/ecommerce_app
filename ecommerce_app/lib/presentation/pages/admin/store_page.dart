import 'package:ecommerce_app/core/utils/roles.dart';
import 'package:ecommerce_app/presentation/pages/admin/body.dart';
import 'package:ecommerce_app/presentation/widgets/roleBasedAccessControlWidget.dart';
import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AccessControlWidget(allowedRole: Roles.ADMIN, child: StoreBody());
  }
}
