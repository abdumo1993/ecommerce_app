import 'package:ecommerce_app/domain/entities/edit_user.dart';
import 'package:ecommerce_app/presentation/controllers/admin_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewUsers extends StatefulWidget {
  const ViewUsers({super.key});

  @override
  State<ViewUsers> createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> {
  final AdminUsersController controller = Get.put(AdminUsersController());

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.primary,
      child: GetBuilder(
          init: Get.find<AdminUsersController>(),
          builder: (controller) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.onSecondary,
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                      controller: controller.queryParam,
                      decoration: InputDecoration(
                        hintText: "Search users...",
                        hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      onChanged: (value) {
                        controller.changeList(value);
                      },
                    ),
                  ),
                ),
                // list
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.Users.value.length,
                  itemBuilder: (context, index) {
                    return UserTile(user: controller.Users.value[index]);
                  },
                ),
              ],
            );
          }),
    );
  }
}

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});
  final GetUserModel? user;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Text("User Not Found");
    }
    return Container(
        child: Wrap(
      children: [
        Row(
          children: [
            Text("Name:"),
            Text("${user!.firstname} ${user!.lastname}"),
          ],
        ),
        Row(
          children: [
            Text("Email:"),
            Text("${user!.email}"),
          ],
        ),
        Row(
          children: [
            Text("Phone Number:"),
            Text("${user!.phoneNumber}"),
          ],
        ),
      ],
    ));
  }
}
